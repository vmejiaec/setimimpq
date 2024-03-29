﻿
CREATE FUNCTION [dbo].[_Apu_Oferta_MO_CostTot_CatInd]
(
	@p_apu_oferta_id varchar(17),
    @p_apu_categoria_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
            @v_total numeric(17,4),
			@v_sucursal varchar(17)

set @v_sucursal = (Select Int_Sucursal_Id from Apu_Oferta where Id=@p_apu_oferta_id)

set @v_total =
(select

    dbo._Apu_Oferta_Mano_Obra_Costo_Total_Cuadrilla(@p_apu_oferta_id, Apu_mano_Obra_Id) Costo_total
from
(select Apu_Mano_Obra_Id
from Apu_oferta_mano_obra
where apu_oferta_id = @p_apu_oferta_id
and Apu_Mano_Obra_Id=dbo._apu_parametros_Apu_Mano_Obra_Id(@v_sucursal)
and Apu_Categoria_Id=@p_apu_categoria_id
and dbo._Apu_Oferta_Mano_Obra_Costo_Total_Cuadrilla(@p_apu_oferta_id, Apu_mano_Obra_Id) > 0
Group by Apu_Mano_Obra_Id) Apu_Mano_Obra_Id)


    RETURN  isnull(@v_total,0)

END











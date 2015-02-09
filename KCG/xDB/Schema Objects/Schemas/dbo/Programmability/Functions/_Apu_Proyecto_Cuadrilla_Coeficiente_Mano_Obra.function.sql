﻿CREATE FUNCTION [dbo].[_Apu_Proyecto_Cuadrilla_Coeficiente_Mano_Obra]
(
	@p_apu_proyecto_id varchar(17),
    @p_apu_mano_obra_id varchar(17)
)
RETURNS numeric(17,3)
BEGIN
    
    declare 
       @v_costo_mano_obra numeric (17,4),
       @v_costo numeric(17,4),
       @v_total numeric (17,4)
    

    exec @v_costo_mano_obra
         = dbo._Apu_Proyecto_Mano_Obra_Costo_Total_Cuadrilla  @p_apu_proyecto_id , @p_apu_mano_obra_id

    exec @v_costo = dbo._apu_proyecto_costo_mano_obra_cuadrilla @p_apu_proyecto_id

  if (isnull(@v_costo,0) = 0) 
       set @v_total = 0
   else
	exec  @v_total = dbo.__division_tres_decimales @v_costo_mano_obra , @v_costo
  

    RETURN  @v_total

END











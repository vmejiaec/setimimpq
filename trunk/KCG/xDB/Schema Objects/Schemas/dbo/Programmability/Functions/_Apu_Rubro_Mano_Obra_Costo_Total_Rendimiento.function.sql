﻿create FUNCTION [dbo].[_Apu_Rubro_Mano_Obra_Costo_Total_Rendimiento]
(
	@p_apu_rubro_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_costo_total numeric(17,4)
     
      select  @v_costo_total = 
            (select sum(dbo._apu_rubro_mano_obra_costo_x_rendimiento(id))
             from  apu_rubro_mano_obra
             where apu_rubro_id = @p_apu_rubro_id)
      
    RETURN  isnull(@v_costo_total,0)

END









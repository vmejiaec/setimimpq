﻿create FUNCTION [dbo].[_Apu_Rubro_Equipo_Costo_Total]
(
	@p_apu_rubro_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_costo_total numeric(17,4)
     
      select  @v_costo_total = 
            (select sum(dbo.__multiplicar_cuatro_decimales_2(
                    dbo._apu_equipo_costo_hora (apu_equipo_id),
                    cantidad))
             from  apu_rubro_equipo 
             where apu_rubro_id = @p_apu_rubro_id)
      
    RETURN  isnull(@v_costo_total,0)

END




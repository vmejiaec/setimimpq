create FUNCTION [dbo].[_Apu_Rubro_Equipo_Costo_Hora]
(
	@p_apu_rubro_equipo_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_costo_total numeric(17,4)
     
      select  @v_costo_total = 
            (select dbo._apu_equipo_costo_hora (apu_equipo_id)
             from  apu_rubro_equipo 
             where id = @p_apu_rubro_equipo_id)
      
    RETURN  isnull(@v_costo_total,0)

END







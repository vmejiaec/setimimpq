create FUNCTION [dbo].[_Apu_Rubro_Equipo_Cantidad]
(
	@p_apu_rubro_equipo_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_cantidad numeric(17,4)
     
      select  @v_cantidad =
            (select cantidad
             from  apu_rubro_equipo
             where id = @p_apu_rubro_equipo_id)
      
    RETURN  @v_cantidad

END









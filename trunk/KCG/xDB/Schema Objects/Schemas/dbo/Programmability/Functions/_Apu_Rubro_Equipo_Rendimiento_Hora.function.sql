create FUNCTION [dbo].[_Apu_Rubro_Equipo_Rendimiento_Hora]
(
	@p_apu_rubro_equipo_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
   declare 
      
      @v_apu_rubro_id varchar(17),
      @v_resultado numeric (17,4)

      
      exec @v_apu_rubro_id =
            dbo._apu_rubro_equipo_apu_rubro_id @p_apu_rubro_equipo_id

      exec @v_resultado = 
            dbo._apu_rubro_rendimiento_equipo_hora @v_apu_rubro_id     
 
    return @v_resultado

END










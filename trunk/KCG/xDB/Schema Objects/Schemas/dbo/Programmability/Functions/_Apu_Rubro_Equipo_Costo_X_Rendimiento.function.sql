create FUNCTION [dbo].[_Apu_Rubro_Equipo_Costo_X_Rendimiento]
(
	@p_apu_rubro_equipo_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
   declare 
      @v_costo_hora_x_cantidad numeric(17,4),
      @v_apu_rubro_id varchar(17),
      @v_apu_rubro_rendimiento_equipo_hora numeric(17,6),
      @v_resultado numeric (17,4)

      exec @v_costo_hora_x_cantidad = 
            dbo._apu_rubro_equipo_costo_hora_x_cantidad @p_apu_rubro_equipo_id

      exec @v_apu_rubro_id =
            dbo._apu_rubro_equipo_apu_rubro_id @p_apu_rubro_equipo_id

      exec @v_apu_rubro_rendimiento_equipo_hora = 
            dbo._apu_rubro_rendimiento_equipo_hora @v_apu_rubro_id     

      exec @v_resultado = 
           dbo.__multiplicar_cuatro_decimales_2 @v_costo_hora_x_cantidad, 
                                                @v_apu_rubro_rendimiento_equipo_hora
 
    return @v_resultado

END








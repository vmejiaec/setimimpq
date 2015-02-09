create FUNCTION [dbo].[_Apu_Rubro_Mano_Obra_Costo_X_Rendimiento]
(
	@p_apu_rubro_mano_obra_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
   declare 
      @v_costo_hora_x_cantidad numeric(17,4),
      @v_apu_rubro_id varchar(17),
      @v_apu_rubro_rendimiento_mano_obra_hora numeric(17,6),
      @v_resultado numeric (17,4)

      exec @v_costo_hora_x_cantidad = 
            dbo._apu_rubro_mano_obra_costo_hora_x_cantidad @p_apu_rubro_mano_obra_id

      exec @v_apu_rubro_id =
            dbo._apu_rubro_mano_obra_apu_rubro_id @p_apu_rubro_mano_obra_id

      exec @v_apu_rubro_rendimiento_mano_obra_hora = 
            dbo._apu_rubro_rendimiento_mano_obra_hora @v_apu_rubro_id     

      exec @v_resultado = 
           dbo.__multiplicar_cuatro_decimales_2 @v_costo_hora_x_cantidad, 
                                                @v_apu_rubro_rendimiento_mano_obra_hora
 
    return @v_resultado

END









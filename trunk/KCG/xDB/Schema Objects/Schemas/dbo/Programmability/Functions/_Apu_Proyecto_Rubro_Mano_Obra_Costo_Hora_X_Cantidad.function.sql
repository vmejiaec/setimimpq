create FUNCTION [dbo].[_Apu_Proyecto_Rubro_Mano_Obra_Costo_Hora_X_Cantidad]
(
	@p_apu_proyecto_rubro_mano_obra_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
   declare 
      @v_costo_hora numeric(17,4),
      @v_cantidad numeric(17,4),
      @v_resultado numeric (17,4)

      exec @v_costo_hora = dbo._apu_proyecto_rubro_mano_obra_costo_hora @p_apu_proyecto_rubro_mano_obra_id
      exec @v_cantidad = dbo._apu_proyecto_rubro_mano_obra_cantidad @p_apu_proyecto_rubro_mano_obra_id     
      exec @v_resultado = dbo.__multiplicar_cuatro_decimales_2 @v_costo_hora, @v_cantidad
 
   RETURN  @v_resultado

END









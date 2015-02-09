


create FUNCTION [dbo].[_Apu_Proyecto_Rubro_Mano_Obra_Costo_X_Rendimiento]
(
	@p_apu_proyecto_rubro_mano_obra_id varchar(17),
    @p_Apu_Proyecto_Id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
   declare 
      @v_costo_hora_x_cantidad numeric(17,4),
      @v_apu_proyecto_rubro_id varchar(17),
      @v_apu_proyecto_rubro_rendimiento_mano_obra_hora numeric(17,6),
      @v_resultado numeric (17,4)

      Set @v_costo_hora_x_cantidad = 
          (Select dbo.__multiplicar_cuatro_decimales_2(
                  Cantidad,
                   dbo._Apu_Proyecto_Mano_Obra_Costo_Hora1
                    (@p_Apu_Proyecto_Id, 
                     Apu_Mano_Obra_Id))
          From Apu_Proyecto_Rubro_Mano_Obra
		  Where Id = @p_apu_proyecto_rubro_mano_obra_id)

      exec @v_apu_proyecto_rubro_id =
            dbo._apu_proyecto_rubro_mano_obra_apu_proyecto_rubro_id @p_apu_proyecto_rubro_mano_obra_id

      Select @v_resultado = 
      (Select dbo.__multiplicar_cuatro_decimales_2(
                 @v_costo_hora_x_cantidad,
                 dbo.__division_seis_decimales (8, Rendimiento_Mano_Obra))
      From Apu_Proyecto_Rubro
      Where Id = @v_apu_proyecto_rubro_id)

       return isnull(@v_resultado,0)

END














CREATE FUNCTION [dbo].[_Apu_Proyecto_Rubro_Equipo_Costo_X_Rendimiento]
(
	@p_apu_proyecto_rubro_Equipo_id varchar(17),
    @p_apu_proyecto_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
   declare 
      @v_costo_hora_x_cantidad numeric(17,4),
      @v_apu_proyecto_rubro_id varchar(17),
      @v_apu_proyecto_rubro_rendimiento_Equipo_hora numeric(17,6),
      @v_resultado numeric (17,4)


      Set @v_costo_hora_x_cantidad = 
          (Select dbo.__multiplicar_cuatro_decimales_2(
                  Cantidad,
                   dbo._Apu_Proyecto_Equipo_Costo_Hora1
                    (@p_Apu_Proyecto_Id, 
                     Apu_Equipo_Id))
          From Apu_Proyecto_Rubro_Equipo
		  Where Id = @p_apu_proyecto_rubro_Equipo_id)

      exec @v_apu_proyecto_rubro_id =
            dbo._apu_proyecto_rubro_Equipo_apu_proyecto_rubro_id @p_apu_proyecto_rubro_Equipo_id

      Select @v_resultado = 
      (Select dbo.__multiplicar_cuatro_decimales_2(
                 @v_costo_hora_x_cantidad,
                 dbo.__division_seis_decimales (8, Rendimiento_Equipo))
      From Apu_Proyecto_Rubro
      Where Id = @v_apu_proyecto_rubro_id)

       return isnull(@v_resultado,0)

END












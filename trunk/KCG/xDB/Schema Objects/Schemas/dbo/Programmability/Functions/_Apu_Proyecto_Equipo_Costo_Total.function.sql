--Esta funcion permite obtener el costo Diario del equipo
CREATE FUNCTION [dbo].[_Apu_Proyecto_Equipo_Costo_Total]
(
	@p_apu_proyecto_equipo_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_Costo_Total numeric(17,4)
              
	select  @v_Costo_Total = 
            (select dbo.__suma_cuatro_decimales_5 (
                     costo_combustible,
                     costo_repuesto,
                     costo_mantenimiento,
                     costo_alquiler,
                     costo_otros)
             from  apu_proyecto_equipo
             where id = @p_apu_proyecto_equipo_id)

    RETURN  isnull(@v_Costo_Total,0)

END





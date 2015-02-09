CREATE FUNCTION [dbo].[_Apu_Equipo_Costo_Total]
(
	@p_apu_equipo_id varchar(17)
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
             from  apu_equipo
             where id = @p_apu_equipo_id)

    RETURN  @v_Costo_Total

END



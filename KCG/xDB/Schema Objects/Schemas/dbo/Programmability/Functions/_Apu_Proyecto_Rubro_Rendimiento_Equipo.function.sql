create FUNCTION [dbo].[_Apu_Proyecto_Rubro_Rendimiento_Equipo]
(
	@p_apu_proyecto_rubro_id varchar(17)
)
RETURNS numeric(17,6)
BEGIN
    
    declare @v_rendimiento_equipo numeric(17,6)

	select  @v_rendimiento_equipo = 
            (select rendimiento_equipo 
             from  apu_proyecto_rubro
             where id = @p_apu_proyecto_rubro_id)

    RETURN  @v_rendimiento_equipo

END















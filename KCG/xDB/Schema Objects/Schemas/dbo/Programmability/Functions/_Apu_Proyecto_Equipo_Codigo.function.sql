CREATE FUNCTION [dbo].[_Apu_Proyecto_Equipo_Codigo]
(
	@p_apu_proyecto_equipo_id varchar(17)
)
RETURNS varchar(200)
BEGIN

    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  apu_proyecto_equipo
             where id = @p_apu_proyecto_equipo_id)

    RETURN  @v_codigo

END














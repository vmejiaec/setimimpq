create FUNCTION [dbo].[_Apu_Proyecto_Nombre]
(
	@p_apu_proyecto_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  apu_proyecto
             where id = @p_apu_proyecto_id)

    RETURN  @v_nombre

END














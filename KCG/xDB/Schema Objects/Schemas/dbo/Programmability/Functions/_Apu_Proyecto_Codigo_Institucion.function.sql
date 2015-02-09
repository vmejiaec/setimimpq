CREATE FUNCTION [dbo].[_Apu_Proyecto_Codigo_Institucion]
(
	@p_apu_proyecto_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo_institucion varchar(200)

	select  @v_codigo_institucion = 
            (select Codigo_Institucion
             from  apu_proyecto
             where id = @p_apu_proyecto_id)

    RETURN  @v_codigo_institucion

END

















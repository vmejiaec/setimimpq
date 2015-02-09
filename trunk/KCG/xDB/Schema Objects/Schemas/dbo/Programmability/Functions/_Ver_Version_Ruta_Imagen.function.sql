create FUNCTION [dbo].[_Ver_Version_Ruta_Imagen]
(
	@p_ver_version_id numeric(17,0)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_ruta_imagen varchar(500)

	select  @v_ruta_imagen = 
            (select ruta_imagen 
             from  ver_Version
             where id = @p_ver_version_id)

    RETURN  @v_ruta_imagen

END













create FUNCTION [dbo].[_Ver_Mensaje_Nombre]
(
	@p_ver_version_id  varchar(17),
    @p_par_mensaje_id  varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_nombre varchar(200)

	select  @v_nombre = 
            (select nombre 
             from  ver_mensaje
             where par_mensaje_id = @p_par_mensaje_id 
               and ver_mensaje.ver_version_id=@p_ver_version_id)
RETURN  @v_nombre

END













create FUNCTION [dbo].[_Ver_Version_Nombre]
(
	@p_ver_version_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  ver_version 
             where id = @p_ver_version_id)

    RETURN  @v_nombre

END












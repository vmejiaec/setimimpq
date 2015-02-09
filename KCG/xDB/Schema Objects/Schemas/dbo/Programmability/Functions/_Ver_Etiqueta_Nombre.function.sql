CREATE FUNCTION [dbo].[_Ver_Etiqueta_Nombre]
(
	@p_ver_version_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  ver_etiqueta 
             where ver_version_id = @p_ver_version_id)
              
    RETURN  @v_nombre

END
create FUNCTION [dbo].[_Ver_Version_Codigo]
(
	@p_ver_version_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  ver_Version
             where id = @p_ver_version_id)

    RETURN  @v_codigo

END













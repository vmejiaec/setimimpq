create FUNCTION [dbo].[_Ver_Version_Abreviatura]
(
	@p_ver_version_id varchar(17)
)
RETURNS varchar(10)
BEGIN
    
    declare @v_abreviatura varchar(10)

	select  @v_abreviatura = 
            (select abreviatura 
             from  ver_version 
             where id = @p_ver_version_id)

    RETURN  @v_abreviatura

END














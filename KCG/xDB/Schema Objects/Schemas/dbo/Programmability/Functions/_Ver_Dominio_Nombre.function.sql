create FUNCTION [dbo].[_Ver_Dominio_Nombre]
(
	@p_dic_dominio_id varchar(17),
    @p_ver_version_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_ver_dominio_nombre varchar(500)

	select  @v_ver_dominio_nombre = 
            (select nombre 
             from  ver_dominio 
             where dic_dominio_id = @p_dic_dominio_id
             and ver_version_id = @p_ver_version_id)
             
    RETURN  @v_ver_dominio_nombre
END











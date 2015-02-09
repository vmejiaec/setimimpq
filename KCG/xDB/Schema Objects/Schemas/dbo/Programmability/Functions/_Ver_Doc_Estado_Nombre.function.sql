create FUNCTION [dbo].[_Ver_Doc_Estado_Nombre]
(
	@p_apr_doc_estado_id varchar(17),
    @p_ver_version_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_ver_doc_estado_nombre varchar(500)

	select  @v_ver_doc_estado_nombre = 
            (select nombre 
             from  ver_doc_estado 
             where apr_doc_estado_id = @p_apr_doc_estado_id
             and ver_version_id = @p_ver_version_id)
             
    RETURN  @v_ver_doc_estado_nombre
END










create FUNCTION [dbo].[Estado]
(
	@p_dic_objeto_nombre varchar(500),
    @p_dic_campo_nombre varchar(500),
    @p_estado char(3),
    @p_ver_version_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare 
       @v_dic_objeto_id varchar(17),
       @v_dic_campo_id varchar(17),
       @v_apr_documento_id varchar(17),
       @v_apr_estado_id varchar(17),
       @v_apr_doc_estado_id varchar(17),
       @v_ver_estado_nombre varchar(500)
    
    exec @v_dic_objeto_id  = _dic_objeto_Id @p_dic_objeto_nombre
    exec @v_dic_campo_id   = _dic_campo_Id  @v_dic_objeto_id, @p_dic_campo_nombre
    exec @v_apr_documento_id  = _apr_documento_id @v_dic_campo_id
    exec @v_apr_estado_id  = _apr_estado_Id @p_estado  
    exec @v_apr_doc_estado_id = _apr_doc_estado_id @v_apr_documento_id, @v_apr_estado_id 
    exec @v_ver_estado_nombre = _ver_doc_estado_nombre @v_apr_doc_estado_id, @p_ver_version_id

    RETURN  @v_ver_estado_nombre

END















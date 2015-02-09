create FUNCTION [dbo].[_Apr_Doc_Estado_Dic_Campo_Id]
(
	@p_apr_doc_estado_id varchar(17)
)
RETURNS varchar (17)
BEGIN
    
    declare 
       @v_apr_documento_id varchar (17),
       @v_dic_campo_id varchar (17)

	select  @v_apr_documento_id = 
            (select apr_documento_id 
             from  apr_doc_Estado
             where id = @p_apr_doc_estado_id)
    
    exec @v_dic_campo_id = _apr_documento_dic_campo_id  @v_apr_documento_id

    RETURN  @v_dic_campo_id

END














create FUNCTION [dbo].[_Apr_Doc_Estado_Id]
(
	@p_apr_documento_id varchar (17),
    @p_apr_estado_id varchar (17)
)
RETURNS varchar (17)
BEGIN
    
    declare @v_apr_doc_estado_id varchar(17)

	select  @v_apr_doc_estado_id = 
            (select id 
             from  apr_doc_estado 
             where apr_documento_id = @p_apr_documento_id
             and   apr_estado_id = @p_apr_estado_id)

    RETURN  @v_apr_doc_estado_id

END










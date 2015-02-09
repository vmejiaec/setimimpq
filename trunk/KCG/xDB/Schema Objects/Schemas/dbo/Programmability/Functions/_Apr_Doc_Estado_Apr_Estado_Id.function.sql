create FUNCTION [dbo].[_Apr_Doc_Estado_Apr_Estado_Id]
(
	@p_apr_doc_estado_id varchar(17)
)
RETURNS varchar (17)
BEGIN
    
    declare @v_apr_estado_id varchar (17)

	select  @v_apr_estado_id = 
            (select apr_estado_id 
             from  apr_doc_estado
             where id = @p_apr_doc_estado_id)

    RETURN @v_apr_estado_id

END













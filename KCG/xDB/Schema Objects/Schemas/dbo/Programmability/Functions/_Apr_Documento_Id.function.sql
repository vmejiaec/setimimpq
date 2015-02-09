create FUNCTION [dbo].[_Apr_Documento_Id]
(
	@p_dic_campo_id  varchar(17)
)
RETURNS varchar (17)
BEGIN
    
    declare @v_apr_documento_id varchar(17)

	select  @v_apr_documento_id = 
            (select id 
             from  apr_documento 
             where dic_campo_id = @p_dic_campo_id)

    RETURN  @v_apr_documento_id

END









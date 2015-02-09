create FUNCTION [dbo].[_Apr_Documento_Dic_Campo_Id]
(
	@p_apr_documento_id varchar (17)
)
RETURNS varchar (17)
BEGIN
    
    declare @v_dic_campo_id varchar (17)

	select  @v_dic_campo_id = 
            (select dic_campo_Id 
             from  apr_documento 
             where id = @p_apr_documento_id)

    RETURN  @v_dic_campo_id

END












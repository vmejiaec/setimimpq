create FUNCTION [dbo].[_Apr_Doc_Estado_Apr_Estado_Dominio]
(
	@p_apr_doc_estado_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_apr_estado_id varchar (17),
            @v_dominio char(3)
   
    exec @v_apr_estado_id = _apr_doc_estado_apr_estado_id @p_apr_doc_estado_id
    exec @v_dominio = _apr_estado_dominio @v_apr_estado_id     

    RETURN @v_dominio
END















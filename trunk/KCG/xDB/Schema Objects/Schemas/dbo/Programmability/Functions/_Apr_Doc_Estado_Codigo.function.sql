create FUNCTION [dbo].[_Apr_Doc_Estado_Codigo]
(
	@p_apr_doc_estado_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  apr_doc_Estado
             where id = @p_apr_doc_estado_id)

    RETURN  @v_codigo

END













create FUNCTION [dbo].[_Apr_Documento_Codigo]
(
	@p_apr_documento_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  apr_Documento
             where id = @p_apr_documento_id)

    RETURN  @v_codigo

END












create FUNCTION [dbo].[_Apr_Documento_Nombre]
(
	@p_apr_documento_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  apr_documento 
             where id = @p_apr_documento_id)

    RETURN  @v_nombre

END











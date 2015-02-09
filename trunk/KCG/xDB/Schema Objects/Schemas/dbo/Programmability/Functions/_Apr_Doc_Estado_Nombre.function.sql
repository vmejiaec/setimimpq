create FUNCTION [dbo].[_Apr_Doc_Estado_Nombre]
(
	@p_apr_doc_estado_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select codigo 
             from  apr_doc_estado 
             where id = @p_apr_doc_estado_id)

    RETURN  @v_nombre

END












create FUNCTION [dbo].[_Apr_Estado_Codigo]
(
	@p_apr_estado_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  apr_Estado
             where id = @p_apr_estado_id)

    RETURN  @v_codigo

END












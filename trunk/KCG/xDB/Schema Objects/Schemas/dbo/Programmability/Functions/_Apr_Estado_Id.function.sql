create FUNCTION [dbo].[_Apr_Estado_Id]
(
	@p_dominio char(3)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_apr_estado_id varchar(17)

	select  @v_apr_estado_id = 
            (select id 
             from  apr_estado 
             where dominio = @p_dominio)

    RETURN  @v_apr_estado_id

END







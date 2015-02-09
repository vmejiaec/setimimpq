CREATE FUNCTION [dbo].[_Apr_Estado_Dominio]
(
	@p_apr_estado_id varchar(17)
)
RETURNS char(3)
BEGIN
    
    declare @v_dominio char(3)

	select  @v_dominio = 
            (select dominio 
             from  apr_estado 
             where id = @p_apr_estado_id)

    RETURN  @v_dominio
END
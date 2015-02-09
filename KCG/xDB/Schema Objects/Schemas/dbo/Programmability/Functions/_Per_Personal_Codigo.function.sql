create FUNCTION [dbo].[_Per_Personal_Codigo]
(
	@p_per_personal_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  per_personal 
             where id = @p_per_personal_id)

    RETURN  @v_codigo

END















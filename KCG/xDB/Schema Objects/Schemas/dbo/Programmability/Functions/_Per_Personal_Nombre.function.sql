CREATE FUNCTION [dbo].[_Per_Personal_Nombre]
(
	@p_per_personal_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select dbo.Par_Razon_Social_Nombre(Par_Razon_Social_Id) 
             from  Per_Personal 
             where Id = @p_per_personal_id)

    RETURN  @v_nombre

END
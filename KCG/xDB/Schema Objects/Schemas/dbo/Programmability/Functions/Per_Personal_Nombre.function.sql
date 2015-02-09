


CREATE FUNCTION [dbo].[Per_Personal_Nombre]
(
	@p_Per_Personal_Id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_Nombre varchar(500)

	select  @v_Nombre = 
            (select Nombre 
             from  Per_Personal 
             where Id = @p_Per_Personal_Id)

    RETURN  @v_Nombre

END





















CREATE FUNCTION [dbo].[Per_Personal_Id]
(
	@p_Par_Razon_Social_Numero varchar(200)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_Per_Personal_Id varchar(17)

	select  @v_Per_Personal_Id = 
            (Select Id
			 From Per_Personal
			 Where Par_Razon_Social_Id in 
				(Select Id From Par_Razon_Social
				 Where Numero = @p_Par_Razon_Social_Numero))

    RETURN  @v_Per_Personal_Id

END


















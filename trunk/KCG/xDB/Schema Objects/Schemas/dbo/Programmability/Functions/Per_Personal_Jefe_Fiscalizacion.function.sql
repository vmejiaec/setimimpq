


CREATE FUNCTION [dbo].[Per_Personal_Jefe_Fiscalizacion]
(
	@p_Per_Personal_Id varchar(17)
)
RETURNS varchar(1)
BEGIN
    
    declare @v_Jefe_Fiscalizacion varchar(1)

	select  @v_Jefe_Fiscalizacion = 
            (select Jefe_Fiscalizacion
             from  Per_Personal 
             where Id = @p_Per_Personal_Id)

    RETURN  isnull(@v_Jefe_Fiscalizacion,'N')

END


















create FUNCTION [dbo].[Per_Personal_Codigo]
(
	@p_Per_Personal_Id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_Codigo varchar(200)

	select  @v_Codigo = 
            (select Codigo 
             from  Per_Personal 
             where Id = @p_Per_Personal_Id)

    RETURN  @v_Codigo

END



















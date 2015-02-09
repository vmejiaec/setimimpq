

CREATE FUNCTION [dbo].[Apr_Estado_Codigo]
(
	@p_Apr_Estado_Id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_Codigo varchar(200)

	select  @v_Codigo = 
            (select Codigo 
             from  Apr_Estado
             where Id = @p_Apr_Estado_Id)

    RETURN  @v_Codigo

END



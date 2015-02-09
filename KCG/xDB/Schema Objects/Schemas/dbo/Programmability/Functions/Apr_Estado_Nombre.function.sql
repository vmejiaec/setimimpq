

CREATE FUNCTION [dbo].[Apr_Estado_Nombre]
(
	@p_Apr_Estado_Id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_Nombre varchar(500)

	select  @v_Nombre = 
            (select Nombre 
             from  Apr_Estado 
             where Id = @p_Apr_Estado_Id)

    RETURN  @v_Nombre

END














CREATE FUNCTION [dbo].[Par_Razon_Social_Nombre]
(
	@p_Par_Razon_Social_Id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_Nombre varchar(200)

	select  @v_Nombre = 
            (select Nombre 
             from  Par_Razon_Social
             where Id = @p_Par_Razon_Social_Id)

    RETURN  @v_Nombre

END
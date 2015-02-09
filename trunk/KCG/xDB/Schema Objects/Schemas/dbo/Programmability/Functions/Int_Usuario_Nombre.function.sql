CREATE FUNCTION [dbo].[Int_Usuario_Nombre]
(
	@p_Int_Usuario_Id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_Nombre varchar(500)

	select  @v_Nombre = 
            (select Nombre 
             from  Int_Usuario
             where Id = @p_Int_Usuario_Id)

    RETURN  @v_Nombre

END
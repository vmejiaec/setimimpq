CREATE FUNCTION [dbo].[Fis_Multa_Nombre]
(
	@p_Fis_Multa_Id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_Nombre varchar(500)

	select  @v_Nombre = 
            (select Nombre 
             from Fis_Multa
             where Id = @p_Fis_Multa_Id)

    RETURN  @v_Nombre

END
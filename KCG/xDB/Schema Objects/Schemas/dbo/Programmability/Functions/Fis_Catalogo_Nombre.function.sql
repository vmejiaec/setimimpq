CREATE FUNCTION [dbo].[Fis_Catalogo_Nombre]
(
	@p_Fis_Catalogo_Id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select Nombre 
             from  Fis_Catalogo 
             where id = @p_Fis_Catalogo_Id)

    RETURN  @v_nombre

END
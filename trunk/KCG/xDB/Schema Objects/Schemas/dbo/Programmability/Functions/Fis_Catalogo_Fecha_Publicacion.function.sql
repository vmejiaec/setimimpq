CREATE FUNCTION [dbo].[Fis_Catalogo_Fecha_Publicacion]
(
	@p_Fis_Catalogo_Id varchar(17)
)
RETURNS smalldatetime
BEGIN
    
    declare @v_Fecha_Publicacion smalldatetime

	select  @v_Fecha_Publicacion = 
            (select Fecha_Publicacion
             from Fis_Catalogo
             where Id = @p_Fis_Catalogo_Id)

    RETURN  @v_Fecha_Publicacion

END
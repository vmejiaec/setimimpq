CREATE FUNCTION [dbo].[Fis_Catalogo_Fecha_Creacion]
(
	@p_Fis_Catalogo_Id varchar(17)
)
RETURNS smalldatetime
BEGIN
    
    declare @v_Fecha_Creacion smalldatetime

	select  @v_Fecha_Creacion = 
            (select Fecha_Creacion
             from Fis_Catalogo
             where Id = @p_Fis_Catalogo_Id)

    RETURN  @v_Fecha_Creacion

END
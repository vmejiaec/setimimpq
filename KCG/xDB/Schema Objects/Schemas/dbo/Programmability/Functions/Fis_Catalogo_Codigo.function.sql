CREATE FUNCTION [dbo].[Fis_Catalogo_Codigo]
(
	@p_Fis_Catalogo_Id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select Codigo 
             from Fis_Catalogo
             where Id = @p_Fis_Catalogo_Id)

    RETURN  @v_codigo

END
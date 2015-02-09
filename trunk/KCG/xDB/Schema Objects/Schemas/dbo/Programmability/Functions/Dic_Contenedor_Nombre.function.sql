CREATE FUNCTION [dbo].[Dic_Contenedor_Nombre]
(
	@p_Dic_Contenedor_Id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_Nombre varchar(500)

	select  @v_Nombre = 
            (select Nombre 
             from  Dic_Contenedor 
             where Id = @p_Dic_Contenedor_Id)

    RETURN  @v_Nombre

END
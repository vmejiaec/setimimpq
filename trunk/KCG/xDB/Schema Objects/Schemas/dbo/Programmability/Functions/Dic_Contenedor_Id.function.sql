CREATE FUNCTION [dbo].[Dic_Contenedor_Id]
(
	@p_Dic_Contenedor_Nombre varchar(500)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_Id varchar(17)

	select  @v_Id = 
            (select Id 
             from  Dic_Contenedor 
             where UPPER (Nombre) = UPPER(@p_Dic_Contenedor_Nombre))

    RETURN  @v_Id

END



















CREATE FUNCTION [dbo].[Dic_Modulo_Nombre]
(
	@p_Dic_Modulo_Id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_Nombre varchar(500)

	select  @v_Nombre = 
            (select Nombre 
             from  Dic_Modulo 
             where Id = @p_Dic_Modulo_Id)

    RETURN  @v_Nombre

END













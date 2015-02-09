

CREATE FUNCTION [dbo].[Dic_Campo_Nombre]
(
	@p_Dic_Campo_Id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_Nombre varchar(500)

	select  @v_Nombre = 
            (select Nombre 
             from  Dic_Campo 
             where Id = @p_Dic_Campo_Id)

    RETURN  @v_Nombre

END













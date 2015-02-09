CREATE FUNCTION [dbo].[Dic_Con_Campo_Nombre]
(
	@p_Dic_Con_Campo_Id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_Nombre varchar(500)

	select  @v_Nombre = 
            (select Codigo 
             from  Dic_Con_Campo 
             where Id = @p_Dic_Con_Campo_Id)

    RETURN  @v_Nombre

END
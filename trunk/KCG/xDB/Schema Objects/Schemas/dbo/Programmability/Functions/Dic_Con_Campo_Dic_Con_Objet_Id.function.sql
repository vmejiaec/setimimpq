CREATE FUNCTION [dbo].[Dic_Con_Campo_Dic_Con_Objet_Id]
(
	@p_Dic_Con_Campo_Id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_Dic_Con_Objeto_Id varchar(17)

	select  @v_Dic_Con_Objeto_Id = 
            (select Dic_Con_Objeto_Id 
             from  Dic_Con_Campo 
             where Id = @p_Dic_Con_Campo_Id)

    RETURN  @v_Dic_Con_Objeto_Id

END
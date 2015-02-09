CREATE FUNCTION [dbo].[Dic_Con_Campo_Dic_Campo_Id]
(
	@p_Dic_Con_Campo_Id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_Dic_Campo_Id varchar(17)

	select  @v_Dic_Campo_Id = 
            (select Dic_Campo_Id
             from  Dic_Con_Campo 
             where Id = @p_Dic_Con_Campo_Id)

    RETURN  @v_Dic_Campo_Id

END
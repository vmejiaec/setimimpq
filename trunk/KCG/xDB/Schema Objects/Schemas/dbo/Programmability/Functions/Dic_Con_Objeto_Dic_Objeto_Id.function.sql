CREATE FUNCTION [dbo].[Dic_Con_Objeto_Dic_Objeto_Id]
(
	@p_Dic_Con_Objeto_Id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_Dic_Objeto_Id varchar(17)

	select  @v_Dic_Objeto_Id = 
            (select Dic_Objeto_Id 
             from  Dic_Con_Objeto 
             where Id = @p_Dic_Con_Objeto_Id)

    RETURN  @v_Dic_Objeto_Id

END

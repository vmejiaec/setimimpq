CREATE FUNCTION [dbo].[Dic_Con_Objeto_Codigo]
(
	@p_Dic_Con_Objeto_Id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_Codigo varchar(200)

	select  @v_Codigo = 
            (select Codigo 
             from  Dic_Con_Objeto 
             where Id = @p_Dic_Con_Objeto_Id)

    RETURN  @v_Codigo

END
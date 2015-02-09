

CREATE FUNCTION [dbo].[Dic_Campo_Dic_Objeto_Id]
(
	@p_Dic_Campo_Id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_Dic_Objeto_Id varchar(17)

	select  @v_Dic_Objeto_Id = 
            (select Dic_Objeto_Id
             from  Dic_Campo
             where Id = @p_Dic_Campo_Id)

    RETURN  @v_Dic_Objeto_Id
END











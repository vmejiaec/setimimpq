CREATE FUNCTION [dbo].[Dic_Campo_Codigo]
(
	@p_Dic_Campo_Id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_Codigo varchar(200)

	select  @v_Codigo = 
            (select Codigo 
             from  Dic_Campo 
             where Id = @p_Dic_Campo_Id)

    RETURN  @v_Codigo

END
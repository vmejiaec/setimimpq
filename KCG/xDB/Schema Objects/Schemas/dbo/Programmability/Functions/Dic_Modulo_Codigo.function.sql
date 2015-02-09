

CREATE FUNCTION [dbo].[Dic_Modulo_Codigo]
(
	@p_Dic_Modulo_Id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_Codigo varchar(200)

	select  @v_Codigo = 
            (select Codigo 
             from  Dic_Modulo 
             where Id = @p_Dic_Modulo_Id)

    RETURN  @v_Codigo

END















CREATE FUNCTION [dbo].[Dic_Rotulo_Id]
(
	@p_Nombre varchar(500)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_Id varchar(17)

	select  @v_Id = 
            (select Id 
             from  Dic_Rotulo 
             where Nombre = @p_Nombre)

    RETURN  @v_Id

END














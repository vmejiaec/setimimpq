

CREATE FUNCTION [dbo].[Dic_Con_Elemento_Id]
(
	@p_Tipo char(3),
	@p_Dic_Contenedor_Id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_Id varchar(17)

	select  @v_Id = 
            (select Id
             from  Dic_Con_Elemento 
             where Tipo = @p_Tipo
			 and Dic_Contenedor_Id = @p_Dic_Contenedor_Id)

    RETURN  @v_Id

END
















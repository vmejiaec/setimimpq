CREATE FUNCTION [dbo].[Dic_Contenedor_Dic_Modulo_Id]
(
	@p_Dic_Contenedor_Id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_Dic_Modulo_Id varchar(17)

	select  @v_Dic_Modulo_Id = 
            (select Dic_Modulo_id
             from  Dic_Contenedor 
             where Id = @p_Dic_Contenedor_Id)

    RETURN  @v_Dic_Modulo_Id

END















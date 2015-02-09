CREATE FUNCTION [dbo].[Dic_Objeto_Nombre]
(
	@p_dic_objeto_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select Nombre 
             from  Dic_Objeto 
             where Id = @p_dic_objeto_id)

    RETURN  @v_nombre

END



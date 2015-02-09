create FUNCTION [dbo].[_Dic_Pantalla_Nombre]
(
	@p_dic_pantalla_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  dic_pantalla 
             where id = @p_dic_pantalla_id)

    RETURN  @v_nombre

END










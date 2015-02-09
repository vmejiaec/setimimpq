create FUNCTION [dbo].[_Dic_Contenedor_Nombre]
(
	@p_dic_Contenedor_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  dic_contenedor 
             where id = @p_dic_contenedor_id)

    RETURN  @v_nombre

END












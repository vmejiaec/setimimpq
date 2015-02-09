create FUNCTION [dbo].[_Dic_Objeto_Nombre]
(
	@p_dic_objeto_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  dic_objeto 
             where id = @p_dic_objeto_id)

    RETURN  @v_nombre

END










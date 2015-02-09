create FUNCTION [dbo].[_Dic_Modulo_Nombre]
(
	@p_dic_modulo_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  dic_modulo 
             where id = @p_dic_modulo_id)

    RETURN  @v_nombre

END









create FUNCTION [dbo].[_Dic_Campo_Dic_Objeto]
(
	@p_dic_campo_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare 
        @v_dic_objeto_id varchar(17),
		@v_dic_objeto_nombre varchar(500)

	exec @v_dic_objeto_id = _dic_campo_dic_objeto_id @p_dic_campo_id
    exec @v_dic_objeto_nombre = _dic_objeto_nombre @v_dic_objeto_id

    return @v_dic_objeto_nombre

END










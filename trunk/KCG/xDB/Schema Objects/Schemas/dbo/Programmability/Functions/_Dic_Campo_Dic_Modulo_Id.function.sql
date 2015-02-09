create FUNCTION [dbo].[_Dic_Campo_Dic_Modulo_Id]
(
	@p_dic_campo_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare 
        @v_dic_objeto_id varchar(17),
        @v_dic_modulo_id varchar(17)

	exec @v_dic_objeto_id  = _Dic_campo_Dic_Objeto_Id  @p_dic_campo_id
    exec @v_dic_modulo_id = _dic_objeto_dic_modulo_id @v_dic_objeto_id
         
    RETURN  @v_dic_modulo_id
END






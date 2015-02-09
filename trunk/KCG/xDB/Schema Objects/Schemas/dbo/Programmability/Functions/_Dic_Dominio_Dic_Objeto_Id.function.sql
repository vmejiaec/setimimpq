create FUNCTION [dbo].[_Dic_Dominio_Dic_Objeto_Id]
(
	@p_dic_dominio_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare 
        @v_dic_campo_id varchar(17),
        @v_dic_objeto_id varchar(17)

	exec @v_dic_campo_id  = _dic_dominio_dic_campo_id @p_dic_dominio_id
    exec @v_dic_objeto_id = _dic_campo_dic_objeto_id @v_dic_campo_id
         
    RETURN  @v_dic_objeto_id
END












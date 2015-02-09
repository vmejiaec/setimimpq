create FUNCTION [dbo].[_Dic_Campo_Dic_Objeto_Id]
(
	@p_dic_campo_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_dic_objeto_id varchar(17)

	select  @v_dic_objeto_id = 
            (select dic_objeto_id
             from  dic_campo
             where id = @p_dic_campo_id)

    RETURN  @v_dic_objeto_id

END








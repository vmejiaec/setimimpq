create FUNCTION [dbo].[_Dic_Objeto_Dic_Modulo_Id]
(
	@p_dic_objeto_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_dic_modulo_id varchar(17)

	select  @v_dic_modulo_id = 
            (select dic_modulo_id 
             from  dic_objeto 
             where id = @p_dic_objeto_id)

    RETURN  @v_dic_modulo_id

END








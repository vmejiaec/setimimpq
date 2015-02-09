create FUNCTION [dbo].[_Dic_Con_Objeto_Dic_Objeto_Id]
(
	@p_dic_Con_Objeto_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_dic_objeto_id varchar(17)

	select  @v_dic_objeto_id = 
            (select dic_objeto_id 
             from  dic_con_objeto 
             where id = @p_dic_con_objeto_id)

    RETURN  @v_dic_objeto_id

END












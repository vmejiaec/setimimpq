create FUNCTION [dbo].[_Dic_Con_Elemento_Tool_Dic_Rotulo_Id]
(
	@p_dic_Con_elemento_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_tool_dic_rotulo_id varchar(17)
	select  @v_tool_dic_rotulo_id = 
            (select tool_dic_rotulo_id 
             from  dic_con_elemento 
             where id = @p_dic_con_elemento_id)

    RETURN  @v_tool_dic_rotulo_id

END







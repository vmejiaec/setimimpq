create FUNCTION [dbo].[_Dic_Con_Campo_Tool_Dic_Rotulo_Id]
(
	@p_dic_con_campo_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_tool_dic_rotulo_id varchar(17)

	select  @v_tool_dic_rotulo_id = 
            (select tool_dic_rotulo_id
             from  dic_con_campo 
             where id = @p_dic_con_campo_id)

    RETURN  @v_tool_dic_rotulo_id

END











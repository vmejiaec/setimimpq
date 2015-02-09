create FUNCTION [dbo].[_Dic_Pantalla_Tool_Dic_Rotulo_Id]
(
	@p_dic_pantalla_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_dic_rotulo_id varchar(17)

	select  @v_dic_rotulo_id = 
            (select tool_dic_rotulo_id 
             from  dic_pantalla 
             where id = @p_dic_pantalla_id)

    RETURN  @v_dic_rotulo_id

END



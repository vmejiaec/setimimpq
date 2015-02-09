create FUNCTION [dbo].[_Dic_Con_Elemento_Codigo]
(
	@p_dic_Con_Elemento_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  dic_con_elemento 
             where id = @p_dic_con_elemento_id)

    RETURN  @v_codigo

END












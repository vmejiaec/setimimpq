create FUNCTION [dbo].[_Dic_Con_Campo_Nombre]
(
	@p_dic_con_campo_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select codigo 
             from  dic_con_campo 
             where id = @p_dic_con_campo_id)

    RETURN  @v_nombre

END












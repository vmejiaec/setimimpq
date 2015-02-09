create FUNCTION [dbo].[_Dic_Con_Elemento_Nombre]
(
	@p_dic_con_elemento_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  dic_con_elemento 
             where id = @p_dic_con_elemento_id)

    RETURN  @v_nombre

END














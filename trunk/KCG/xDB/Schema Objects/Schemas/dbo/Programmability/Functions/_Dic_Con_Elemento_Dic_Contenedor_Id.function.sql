create FUNCTION [dbo].[_Dic_Con_Elemento_Dic_Contenedor_Id]
(
	@p_dic_Con_elemento_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_dic_contenedor_id varchar(17)

	select  @v_dic_contenedor_id = 
            (select dic_contenedor_id 
             from  dic_con_elemento 
             where id = @p_dic_con_elemento_id)

    RETURN  @v_dic_contenedor_id

END













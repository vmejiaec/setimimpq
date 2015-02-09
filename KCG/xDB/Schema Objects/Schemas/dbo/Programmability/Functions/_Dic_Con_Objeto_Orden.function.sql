create FUNCTION [dbo].[_Dic_Con_Objeto_Orden]
(
	@p_dic_Con_Objeto_id varchar(17)
)
RETURNS int
BEGIN
    
    declare @v_orden int

	select  @v_orden = 
            (select orden 
             from  dic_con_objeto 
             where id = @p_dic_con_objeto_id)

    RETURN  @v_orden

END












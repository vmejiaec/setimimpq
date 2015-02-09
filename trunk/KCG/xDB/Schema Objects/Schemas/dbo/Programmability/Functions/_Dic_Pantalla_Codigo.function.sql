create FUNCTION [dbo].[_Dic_Pantalla_Codigo]
(
	@p_dic_pantalla_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  dic_pantalla 
             where id = @p_dic_pantalla_id)

    RETURN  @v_codigo

END










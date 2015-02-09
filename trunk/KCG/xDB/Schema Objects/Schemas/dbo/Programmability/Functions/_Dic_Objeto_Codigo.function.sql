create FUNCTION [dbo].[_Dic_Objeto_Codigo]
(
	@p_dic_Objeto_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  dic_Objeto 
             where id = @p_dic_Objeto_id)

    RETURN  @v_codigo

END










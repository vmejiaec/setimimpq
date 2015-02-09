create FUNCTION [dbo].[_Dic_Modulo_Codigo]
(
	@p_dic_modulo_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  dic_modulo 
             where id = @p_dic_modulo_id)

    RETURN  @v_codigo

END









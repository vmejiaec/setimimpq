create FUNCTION [dbo].[_Dic_Rotulo_Codigo]
(
	@p_dic_rotulo_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  dic_rotulo 
             where id = @p_dic_rotulo_id)

    RETURN  @v_codigo

END










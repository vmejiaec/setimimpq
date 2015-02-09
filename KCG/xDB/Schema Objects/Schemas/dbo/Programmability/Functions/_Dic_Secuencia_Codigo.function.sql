create FUNCTION [dbo].[_Dic_Secuencia_Codigo]
(
	@p_dic_Secuencia_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  dic_Secuencia 
             where id = @p_dic_Secuencia_id)

    RETURN  @v_codigo

END











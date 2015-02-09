create FUNCTION [dbo].[_Dic_Dominio_Codigo]
(
	@p_dic_dominio_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  dic_Dominio
             where id = @p_dic_dominio_id)

    RETURN  @v_codigo

END













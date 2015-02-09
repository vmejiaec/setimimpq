create FUNCTION [dbo].[_Dic_Campo_Codigo]
(
	@p_dic_campo_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  dic_campo 
             where id = @p_dic_campo_id)

    RETURN  @v_codigo

END










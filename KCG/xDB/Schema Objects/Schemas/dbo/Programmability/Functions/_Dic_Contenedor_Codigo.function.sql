create FUNCTION [dbo].[_Dic_Contenedor_Codigo]
(
	@p_dic_contenedor_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  dic_contenedor 
             where id = @p_dic_contenedor_id)

    RETURN  @v_codigo

END










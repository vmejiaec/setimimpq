CREATE FUNCTION [dbo].[_Dic_Contenedor_Tipo]
(
	@p_dic_contenedor_id varchar(17)
)
RETURNS varchar(3)
BEGIN
    
    declare @v_tipo varchar(3)

	select  @v_tipo = 
            (select tipo
             from  dic_contenedor 
             where id = @p_dic_contenedor_id)

    RETURN  @v_tipo

END

create FUNCTION [dbo].[_Dic_Contenedor_Dic_Modulo_Id]
(
	@p_Dic_contenedor_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_dic_modulo_id varchar(17)

	select  @v_dic_modulo_id = 
            (select dic_modulo_id
             from  dic_contenedor 
             where id = @p_dic_contenedor_id)

    RETURN  @v_dic_modulo_id

END











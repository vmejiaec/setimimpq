create FUNCTION [dbo].[_Dic_Campo_Filtro]
(
	@p_dic_campo_id varchar(17)
)
RETURNS varchar(3)
BEGIN
    
    declare @v_filtro varchar(3)

	select  @v_filtro = 
            (select filtro
             from  dic_campo 
             where id = @p_dic_campo_id)

    RETURN  @v_filtro

END












create FUNCTION [dbo].[_Dic_Campo_Nombre]
(
	@p_dic_campo_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  dic_campo 
             where id = @p_dic_campo_id)

    RETURN  @v_nombre

END










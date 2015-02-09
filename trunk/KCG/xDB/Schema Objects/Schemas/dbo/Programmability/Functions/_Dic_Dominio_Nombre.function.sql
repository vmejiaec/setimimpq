create FUNCTION [dbo].[_Dic_Dominio_Nombre]
(
	@p_dic_dominio_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  dic_dominio 
             where id = @p_dic_dominio_id)

    RETURN  @v_nombre

END












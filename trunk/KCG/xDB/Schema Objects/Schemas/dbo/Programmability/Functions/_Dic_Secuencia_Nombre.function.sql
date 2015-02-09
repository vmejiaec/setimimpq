create FUNCTION [dbo].[_Dic_Secuencia_Nombre]
(
	@p_dic_Secuencia_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  dic_Secuencia 
             where id = @p_dic_Secuencia_id)

    RETURN  @v_nombre

END











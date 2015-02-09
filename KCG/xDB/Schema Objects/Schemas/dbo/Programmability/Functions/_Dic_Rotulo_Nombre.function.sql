create FUNCTION [dbo].[_Dic_Rotulo_Nombre]
(
	@p_dic_Rotulo_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  dic_rotulo 
             where id = @p_dic_rotulo_id)

    RETURN  @v_nombre

END










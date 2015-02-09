

CREATE FUNCTION [dbo].[Dic_Rotulo_Nombre]
(
	@p_dic_Rotulo_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select Nombre 
             from  Dic_Rotulo 
             where Id = @p_dic_Rotulo_id)

    RETURN  @v_nombre

END













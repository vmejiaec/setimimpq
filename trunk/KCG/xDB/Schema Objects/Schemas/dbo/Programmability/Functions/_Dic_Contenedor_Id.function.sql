create FUNCTION [dbo].[_Dic_Contenedor_Id]
(
	@p_dic_contenedor_nombre varchar(500)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_Id varchar(17)

	select  @v_Id = 
            (select Id 
             from  dic_contenedor 
             where UPPER (nombre) = UPPER(@p_dic_contenedor_nombre))

    RETURN  @v_Id

END












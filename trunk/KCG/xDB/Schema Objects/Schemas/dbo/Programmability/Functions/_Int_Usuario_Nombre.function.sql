create FUNCTION [dbo].[_Int_Usuario_Nombre]
(
	@p_int_usuario_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  int_usuario
             where id = @p_int_usuario_id)

    RETURN  @v_nombre

END












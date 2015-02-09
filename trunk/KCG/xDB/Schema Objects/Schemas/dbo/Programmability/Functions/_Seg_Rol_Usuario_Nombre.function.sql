create FUNCTION [dbo].[_Seg_Rol_Usuario_Nombre]
(
	@p_seg_rol_usuario_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select codigo 
             from  seg_rol_usuario 
             where id = @p_seg_rol_usuario_id)

    RETURN  @v_nombre

END














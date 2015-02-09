create FUNCTION [dbo].[_Seg_Rol_Usuario_Codigo]
(
	@p_seg_rol_usuario_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  seg_rol_usuario 
             where id = @p_seg_rol_usuario_id)

    RETURN  @v_codigo

END













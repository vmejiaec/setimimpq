create FUNCTION [dbo].[_Seg_Rol_Usuario_Seg_Rol_Id]
(
	@p_seg_rol_usuario_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_seg_rol_id varchar(17)

	select  @v_seg_rol_id = 
            (select seg_rol_id 
             from  seg_rol_usuario 
             where id = @p_seg_rol_usuario_id)

    RETURN  @v_seg_rol_id

END













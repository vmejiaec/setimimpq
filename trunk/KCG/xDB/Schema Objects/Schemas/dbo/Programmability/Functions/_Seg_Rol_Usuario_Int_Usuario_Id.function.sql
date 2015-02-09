create FUNCTION [dbo].[_Seg_Rol_Usuario_Int_Usuario_Id]
(
	@p_seg_rol_usuario_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_int_usuario_id varchar(17)

	select  @v_int_usuario_id = 
            (select int_usuario_id 
             from  seg_rol_usuario 
             where id = @p_seg_rol_usuario_id)

    RETURN  @v_int_usuario_id

END

















CREATE FUNCTION [dbo].[Seg_Rol_Usuario_Seg_Rol_Id]
(
	@p_seg_rol_usuario_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_seg_rol_id varchar(17)

	select  @v_seg_rol_id = 
            (select Seg_Rol_Id 
             from  Seg_Rol_Usuario 
             where Id = @p_seg_rol_usuario_id)

    RETURN  @v_seg_rol_id

END















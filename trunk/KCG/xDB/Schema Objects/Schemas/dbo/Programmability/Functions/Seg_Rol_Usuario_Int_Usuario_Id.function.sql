

CREATE FUNCTION [dbo].[Seg_Rol_Usuario_Int_Usuario_Id]
(
	@p_seg_rol_usuario_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_int_usuario_id varchar(17)

	select  @v_int_usuario_id = 
            (select Int_Usuario_Id 
             from  Seg_Rol_Usuario 
             where Id = @p_seg_rol_usuario_id)

    RETURN  @v_int_usuario_id

END

















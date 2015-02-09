create FUNCTION [dbo].[_Seg_Rol_Nombre]
(
	@p_seg_rol_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  seg_rol 
             where id = @p_seg_rol_id)

    RETURN  @v_nombre

END













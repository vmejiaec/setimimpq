CREATE FUNCTION [dbo].[_Apu_Material_Nombre]
(
	@p_apu_Material_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  apu_Material 
             where id = @p_apu_Material_id)

    RETURN  @v_nombre

END













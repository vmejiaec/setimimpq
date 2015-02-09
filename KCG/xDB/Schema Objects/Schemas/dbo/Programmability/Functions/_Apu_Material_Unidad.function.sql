CREATE FUNCTION [dbo].[_Apu_Material_Unidad]
(
	@p_Apu_Material_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_unidad varchar(200)

	select  @v_unidad = 
            (select unidad 
             from  apu_Material
             where id = @p_apu_Material_id)

    RETURN  @v_unidad

END















CREATE FUNCTION [dbo].[_Apu_Material_Costo_Otros]
(
	@p_apu_material_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_Costo_Otros numeric(17,4)
              

	select  @v_Costo_Otros = 
            (select costo_otros
             from  apu_material
             where id = @p_apu_material_id)

    RETURN  @v_Costo_Otros

END



CREATE FUNCTION [dbo].[_Apu_Material_Costo_Parcial]
(
	@p_apu_material_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_Costo_Parcial numeric(17,4)
              

	select  @v_Costo_Parcial = 
            (select costo_parcial
             from  apu_material
             where id = @p_apu_material_id)

    RETURN  @v_Costo_Parcial

END



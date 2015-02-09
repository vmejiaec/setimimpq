CREATE FUNCTION [dbo].[_Apu_Material_Costo_Total]
(
	@p_apu_material_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_Costo_Total numeric(17,4)
              

	select  @v_Costo_Total = 
            (select dbo.__suma_cuatro_decimales_2(Costo_Parcial,Costo_Otros)
             from  apu_material
             where id = @p_apu_material_id)

    RETURN  @v_Costo_Total

END



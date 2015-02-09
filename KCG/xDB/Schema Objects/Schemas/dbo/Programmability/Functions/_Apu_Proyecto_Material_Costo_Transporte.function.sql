CREATE FUNCTION [dbo].[_Apu_Proyecto_Material_Costo_Transporte]
(
	@p_apu_proyecto_material_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_Costo_Transporte numeric(17,4)
              

	select  @v_Costo_Transporte = 
            (select costo_transporte
             from  apu_proyecto_material
             where id = @p_apu_proyecto_material_id)

    RETURN  @v_Costo_Transporte

END



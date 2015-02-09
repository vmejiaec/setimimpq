CREATE FUNCTION [dbo].[_Apu_Transporte_Costo_Total]
(
	@p_apu_material_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_Costo_Transporte numeric(17,4)
              

	select  @v_Costo_Transporte = 
            (select costo_transporte
             from  apu_material
             where id = @p_apu_material_id)

    RETURN  @v_Costo_Transporte

END



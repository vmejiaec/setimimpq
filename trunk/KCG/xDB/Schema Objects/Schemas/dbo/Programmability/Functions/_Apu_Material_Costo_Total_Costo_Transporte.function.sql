CREATE FUNCTION [dbo].[_Apu_Material_Costo_Total_Costo_Transporte]
(
	@p_apu_material_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
        @v_Costo_Total numeric(17,4),
        @v_Costo_Transporte numeric(17,4),
        @v_resultado numeric(17,4)

              
    exec @v_Costo_Total =      dbo._Apu_Material_Costo_Total @p_apu_material_id
    exec @v_Costo_Transporte = dbo._Apu_Transporte_Costo_Total @p_apu_material_id
    exec @v_resultado = dbo.__suma_cuatro_decimales_2 @v_Costo_Total, @v_Costo_Transporte
	
    RETURN  @v_resultado

END




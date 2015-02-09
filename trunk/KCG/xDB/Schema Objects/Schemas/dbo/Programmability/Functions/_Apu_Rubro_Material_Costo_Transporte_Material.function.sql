create FUNCTION [dbo].[_Apu_Rubro_Material_Costo_Transporte_Material]
(
	@p_apu_rubro_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_costo_material numeric(17,4),
      @v_costo_transporte numeric(17,4),
      @v_costo_total numeric (17,4)

    exec @v_costo_material = dbo._apu_rubro_material_costo_total @p_apu_rubro_id
    exec @v_costo_transporte = dbo._apu_rubro_transporte_costo_total @p_apu_rubro_id
    
    exec @v_costo_total = dbo.__suma_cuatro_decimales_2 @v_costo_material, @v_costo_transporte

    return  isnull(@v_costo_total,0)

END







create FUNCTION [dbo].[_Apu_Rubro_Material_Costo_Total1]
(
	@p_apu_rubro_material_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_costo_total numeric(17,4)
     
      select  @v_costo_total = 
            (select dbo.__multiplicar_cuatro_decimales_2(
                    dbo._apu_material_costo_total (apu_material_id),
                    cantidad)
             from  apu_rubro_material 
             where id = @p_apu_rubro_material_id)
      
    RETURN  isnull(@v_costo_total,0)

END







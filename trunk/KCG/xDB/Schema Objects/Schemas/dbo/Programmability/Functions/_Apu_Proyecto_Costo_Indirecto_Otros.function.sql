CREATE FUNCTION [dbo].[_Apu_Proyecto_Costo_Indirecto_Otros]
(
	@p_apu_proyecto_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_apu_proyecto_costo_indirecto numeric(17,4),
      @v_apu_proyecto_costo_otros numeric(17,4),
      @v_total numeric (17,4)

      exec @v_apu_proyecto_costo_indirecto = 
             dbo._apu_proyecto_costo_indirecto @p_apu_proyecto_id

      exec @v_apu_proyecto_costo_otros = 
             dbo._apu_proyecto_costo_otros @p_apu_proyecto_id

      exec @v_total = dbo.__suma_cuatro_decimales_2
                            @v_apu_proyecto_costo_indirecto,
                            @v_apu_proyecto_costo_otros
 
    return  isnull(@v_total,0)

END
















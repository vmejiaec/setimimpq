CREATE FUNCTION [dbo].[_Apu_Proyecto_Costo_Otros]
(
	@p_apu_proyecto_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_apu_proyecto_costo_directo numeric(17,4),
      @v_apu_proyecto_porcentaje_costo_otros numeric(5,2),
      @v_costo_otros numeric (17,4)

      exec @v_apu_proyecto_costo_directo = 
             dbo._apu_proyecto_costo_directo @p_apu_proyecto_id

      exec @v_apu_proyecto_porcentaje_costo_otros = 
             dbo._apu_proyecto_porcentaje_costo_otros @p_apu_proyecto_id
      
      exec @v_costo_otros = dbo.__porcentaje_cuatro_decimales
                            @v_apu_proyecto_costo_directo,
                            @v_apu_proyecto_porcentaje_costo_otros
 
    RETURN  @v_costo_otros

END















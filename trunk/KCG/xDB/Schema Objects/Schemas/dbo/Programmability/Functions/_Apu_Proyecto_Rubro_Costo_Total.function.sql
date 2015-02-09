


-- COSTO TOTAL DE TODOS LOS RUBROS DE UN PROYECTO
-- COSTO_TOTAL = COSTO_UNITARIO DE UN RUBRO sin indirectos * CANTIDAD DE CADA RUBRO
CREATE FUNCTION [dbo].[_Apu_Proyecto_Rubro_Costo_Total]
(
	@p_apu_proyecto_rubro_id varchar(17)
)
RETURNS numeric (17,4)
BEGIN
    
    declare 
       @v_costo_unitario     numeric (17,4),
       @v_cantidad           numeric (17,4),
       @v_resultado          numeric (17,4)
     
    set @v_costo_unitario = dbo._apu_proyecto_rubro_costo_uni_sin_ind (@p_apu_proyecto_rubro_id)
    set @v_cantidad = dbo._apu_proyecto_rubro_cantidad (@p_apu_proyecto_rubro_id)

    set @v_resultado = dbo.__multiplicar_cuatro_decimales_2 (
                     @v_costo_unitario,
                     @v_cantidad) 
   
    RETURN  isnull( @v_resultado,0)

END



















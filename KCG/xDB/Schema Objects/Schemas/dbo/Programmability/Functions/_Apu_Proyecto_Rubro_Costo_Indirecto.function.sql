
--se obtiene el porcentaje de costos indirectos y otros de
--un proyecto_x_rubro
CREATE FUNCTION [dbo].[_Apu_Proyecto_Rubro_Costo_Indirecto]
(
	@p_apu_proyecto_rubro_id varchar(17)
)
RETURNS numeric (17,4)
BEGIN
    
    declare 
       @v_costo      numeric(17,4),
       @v_apu_proyecto_id    varchar(17),
       @v_porcentaje         numeric (5,2),
       @v_resultado          numeric (17,4)
     
    set @v_costo = dbo._apu_proyecto_rubro_costo_unitario (@p_apu_proyecto_rubro_id)
    set @v_apu_proyecto_id = dbo._apu_proyecto_rubro_apu_proyecto_id (@p_apu_proyecto_rubro_id)
    set @v_porcentaje = dbo._apu_Proyecto_Porcentaje_Costo_Indirecto_Otros (@v_apu_proyecto_id)    

    set @v_resultado = dbo.__porcentaje_cuatro_decimales (
                     @v_costo,
                     @v_porcentaje) 
   
    RETURN  @v_resultado

END
















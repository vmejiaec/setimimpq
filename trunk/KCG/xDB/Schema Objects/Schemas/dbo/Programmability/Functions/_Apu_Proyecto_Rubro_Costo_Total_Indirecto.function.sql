


--El costo unitario ya tiene icluido los costos indirectos, por tal motivo
-- No es necesario volver a sumar costos indirectos.

CREATE FUNCTION [dbo].[_Apu_Proyecto_Rubro_Costo_Total_Indirecto]
(
	@p_apu_proyecto_rubro_id varchar(17)
)
RETURNS numeric (17,2)
BEGIN
    
    declare 
       @v_costo_unitario     numeric(17,4),
       @v_costo_total     numeric(17,4),
       @v_cantidad           numeric(17,4),
       @v_costo_indirecto    numeric(17,4),
       @v_resultado          numeric(17,2)
    
    set @v_costo_unitario = dbo._apu_proyecto_rubro_costo_unitario (@p_apu_proyecto_rubro_id)

    set @v_cantidad = dbo._apu_proyecto_rubro_cantidad (@p_apu_proyecto_rubro_id)

    set @v_costo_total = dbo.__multiplicar_dos_decimales_2 (@v_costo_unitario,@v_cantidad) 
    
    
    return  @v_costo_total

END









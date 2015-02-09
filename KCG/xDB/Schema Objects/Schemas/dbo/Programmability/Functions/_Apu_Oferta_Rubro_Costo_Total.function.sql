CREATE FUNCTION [dbo].[_Apu_Oferta_Rubro_Costo_Total]
(
	@p_apu_Oferta_rubro_id varchar(17)
)
RETURNS numeric (17,4)
BEGIN
    
    declare 
       @v_costo_unitario     numeric(17,4),
       @v_cantidad           numeric(17,4),
       @v_resultado          numeric (17,4)
     
    --set @v_costo_unitario = dbo._apu_Oferta_rubro_costo_unitario (@p_apu_Oferta_rubro_id)
	set @v_costo_unitario = dbo._Apu_Oferta_Rubro_Costo_Uni_Sin_Ind (@p_apu_Oferta_rubro_id)
    set @v_cantidad = dbo._apu_Oferta_rubro_cantidad (@p_apu_Oferta_rubro_id)

    set @v_resultado = dbo.__multiplicar_cuatro_decimales_2 (
                     @v_costo_unitario,
                     @v_cantidad) 
   
    RETURN  @v_resultado

END












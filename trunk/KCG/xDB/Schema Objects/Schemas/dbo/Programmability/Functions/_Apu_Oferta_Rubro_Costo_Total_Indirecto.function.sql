CREATE FUNCTION [dbo].[_Apu_Oferta_Rubro_Costo_Total_Indirecto]
(
	@p_apu_Oferta_rubro_id varchar(17)
)
RETURNS numeric (17,2)
BEGIN
    
    declare 
       @v_costo_total     numeric(17,4),
       @v_costo_indirecto numeric(17,4),
       @v_resultado          numeric (17,2)
     
    set @v_costo_total     = dbo._apu_Oferta_rubro_costo_total (@p_apu_Oferta_rubro_id)
    set @v_costo_indirecto = dbo._apu_Oferta_rubro_costo_indirecto (@p_apu_Oferta_rubro_id)

    set @v_resultado = dbo.__SUMA_dos_decimales_2 (
                     @v_costo_total,
                     @v_costo_indirecto) 
   
    RETURN  @v_costo_total

END




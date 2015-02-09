CREATE FUNCTION [dbo].[_Apu_Oferta_Rubro_Costo_Indirecto]
(
	@p_apu_oferta_rubro_id varchar(17)
)
RETURNS numeric (17,4)
BEGIN
    
    declare 
       @v_costo      numeric(17,4),
       @v_apu_oferta_id    varchar(17),
       @v_porcentaje         numeric (5,2),
       @v_resultado          numeric (17,4)
     
    set @v_costo = dbo._apu_oferta_rubro_costo_total (@p_apu_oferta_rubro_id)
    set @v_apu_oferta_id = dbo._apu_oferta_rubro_apu_oferta_id (@p_apu_oferta_rubro_id)
    set @v_porcentaje = dbo._apu_oferta_Porcentaje_Costo_Indirecto_Otros (@v_apu_oferta_id)    

    set @v_resultado = dbo.__porcentaje_cuatro_decimales (
                     @v_costo,
                     @v_porcentaje) 
   
    RETURN  @v_resultado

END















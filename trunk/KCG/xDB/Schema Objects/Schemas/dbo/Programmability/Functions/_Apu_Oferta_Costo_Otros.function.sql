CREATE FUNCTION [dbo].[_Apu_Oferta_Costo_Otros]
(
	@p_Apu_Oferta_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_apu_Oferta_Costo_Directo numeric(17,4),
      @v_apu_Oferta_Porcentaje_Costo_Otros numeric(5,2),
      @v_costo_otros numeric (17,4)

      exec @v_apu_Oferta_costo_directo = 
             dbo._apu_Oferta_costo_directo @p_apu_Oferta_id

      exec @v_apu_Oferta_porcentaje_costo_otros = 
             dbo._apu_Oferta_porcentaje_costo_otros @p_apu_Oferta_id
      
      exec @v_costo_otros = dbo.__porcentaje_cuatro_decimales
                            @v_apu_Oferta_costo_directo,
                            @v_apu_Oferta_porcentaje_costo_otros
 
    RETURN  isnull(@v_costo_otros,0)

END

















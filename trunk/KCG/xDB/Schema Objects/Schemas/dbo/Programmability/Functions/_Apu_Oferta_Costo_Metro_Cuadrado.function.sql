CREATE FUNCTION [dbo].[_Apu_Oferta_Costo_Metro_Cuadrado]
(
	@p_apu_Oferta_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_apu_Oferta_costo_total numeric(17,4),
      @v_apu_Oferta_area numeric(17,4),
      @v_total numeric (17,4)

      exec @v_apu_Oferta_costo_total = 
             dbo._apu_Oferta_costo_total_1 @p_apu_Oferta_id

      exec @v_apu_Oferta_area = 
             dbo._apu_Oferta_area @p_apu_Oferta_id
      
     if (@v_apu_Oferta_area = 0)
         set @v_total = 0
      else

	      exec @v_total = dbo.__division_cuatro_decimales
                            @v_apu_Oferta_costo_total,
							@v_apu_Oferta_area
 
    RETURN  isnull(@v_total,0)

END
























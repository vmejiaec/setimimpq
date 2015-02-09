CREATE FUNCTION [dbo].[_Apu_Oferta_Costo_Total]
(
	@p_apu_Oferta_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_apu_Oferta_costo_directo numeric(17,4),
      @v_apu_Oferta_costo_indirecto numeric(17,4),
      @v_apu_Oferta_costo_otros numeric(17,4),
      @v_total numeric (17,4)

      exec @v_apu_Oferta_costo_directo = 
             dbo._apu_Oferta_costo_directo @p_apu_Oferta_id

      exec @v_apu_Oferta_costo_indirecto = 
             dbo._apu_Oferta_costo_indirecto @p_apu_Oferta_id
      
      exec @v_apu_Oferta_costo_otros = 
             dbo._apu_Oferta_costo_otros @p_apu_Oferta_id

      exec @v_total = dbo.__suma_cuatro_decimales_3
                            @v_apu_Oferta_costo_directo,
							@v_apu_Oferta_costo_indirecto,
                            @v_apu_Oferta_costo_otros
 
    set @v_total=@v_total

    RETURN  isnull(@v_total,0)

END





















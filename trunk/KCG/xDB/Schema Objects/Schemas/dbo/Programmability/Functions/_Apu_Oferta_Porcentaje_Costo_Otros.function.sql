create FUNCTION [dbo].[_Apu_Oferta_Porcentaje_Costo_Otros]
(
	@p_apu_Oferta_id varchar(17)
)
RETURNS numeric(5,2)
BEGIN
    
    declare @v_porcentaje_costo_otros numeric(5,2)

	select  @v_porcentaje_costo_otros = 
            (select porcentaje_costo_otros
             from  apu_Oferta
             where id = @p_apu_Oferta_id)

    RETURN  isnull(@v_porcentaje_costo_otros,0)

END














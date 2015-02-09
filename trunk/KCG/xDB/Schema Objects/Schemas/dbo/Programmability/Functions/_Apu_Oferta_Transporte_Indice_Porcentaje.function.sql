CREATE FUNCTION [dbo].[_Apu_Oferta_Transporte_Indice_Porcentaje]
(
	@p_apu_Oferta_transporte_indice_id varchar(17)
)
RETURNS numeric(5,2)
BEGIN
    
    declare @v_porcentaje numeric(5,2)

	select  @v_porcentaje = 
            (select porcentaje
             from  apu_Oferta_transporte_indice
             where id = @p_apu_Oferta_transporte_indice_id)

RETURN  @v_porcentaje

END












CREATE FUNCTION [dbo].[_Apu_Oferta_Transporte_Suma_Porcentaje]
(
	@p_apu_Oferta_id varchar(17)
)
RETURNS numeric(5,2)
BEGIN
    
    declare @v_suma_porcentaje numeric(5,2)
              
	select  @v_suma_porcentaje = 
            (select sum (porcentaje)
             from  apu_Oferta_transporte_indice
             where apu_Oferta_id = @p_apu_Oferta_id)

    RETURN  isnull(@v_suma_porcentaje,0)

END









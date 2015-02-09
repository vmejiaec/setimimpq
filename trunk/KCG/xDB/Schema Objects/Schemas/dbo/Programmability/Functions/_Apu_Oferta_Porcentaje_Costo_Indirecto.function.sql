create FUNCTION [dbo].[_Apu_Oferta_Porcentaje_Costo_Indirecto]
(
	@p_Apu_Oferta_id varchar(17)
)
RETURNS numeric (5,2)
BEGIN
    
    declare @v_porcentaje_costo_indirecto numeric(5,2)

	select  @v_porcentaje_costo_indirecto = 
            (select porcentaje_costo_indirecto 
             from  apu_Oferta
             where id = @p_apu_Oferta_id)

    RETURN  @v_porcentaje_costo_indirecto

END


















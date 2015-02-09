CREATE FUNCTION [dbo].[_Apu_Oferta_Transporte_Indice_Apu_Oferta_Id]
(
	@p_apu_Oferta_Transporte_Indice_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_apu_Oferta_id varchar(17)

	select  @v_apu_Oferta_Id = 
            (select apu_Oferta_Id 
             from  apu_Oferta_Transporte_Indice
             where id = @p_apu_Oferta_Transporte_Indice_id)

    RETURN  @v_apu_Oferta_id

END














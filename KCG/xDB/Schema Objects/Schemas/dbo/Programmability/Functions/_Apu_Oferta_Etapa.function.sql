CREATE FUNCTION [dbo].[_Apu_Oferta_Etapa]
(
	@p_apu_Oferta_id varchar(17)
)
RETURNS char(3)
BEGIN
    
    declare @v_etapa char(3)

	select  @v_etapa = 
            (select etapa 
             from  apu_Oferta
             where id = @p_apu_Oferta_id)

    return  @v_etapa

END




















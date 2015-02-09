CREATE FUNCTION [dbo].[_Apu_Oferta_Equipo_Apu_Oferta_Id]
(
	@p_apu_Oferta_Equipo_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_apu_Oferta_id varchar(17)

	select  @v_apu_Oferta_id = 
            (select apu_Oferta_id 
             from  apu_Oferta_Equipo
             where id = @p_apu_Oferta_Equipo_id)

    RETURN  @v_apu_Oferta_id

END

















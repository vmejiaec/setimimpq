CREATE FUNCTION [dbo].[_Apu_Oferta_Nombre]
(
	@p_apu_Oferta_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  apu_Oferta
             where id = @p_apu_Oferta_id)

    RETURN  @v_nombre

END















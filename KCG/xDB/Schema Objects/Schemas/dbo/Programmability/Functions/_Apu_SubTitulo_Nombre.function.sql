CREATE FUNCTION [dbo].[_Apu_SubTitulo_Nombre]
(
	@p_apu_subtitulo_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  apu_subtitulo 
             where id = @p_apu_subtitulo_id)

    RETURN  @v_nombre

END













CREATE FUNCTION [dbo].[_Apu_Subtitulo_Codigo]
(
	@p_apu_subtitulo_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  apu_subtitulo
             where id = @p_apu_subtitulo_id)

    RETURN  @v_codigo

END
















CREATE FUNCTION [dbo].[_Apu_Subtitulo_Apu_Titulo_Id]
(
	@p_apu_subtitulo_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_id varchar(17)

	select  @v_id = 
            (select apu_titulo_id 
             from  apu_subtitulo
             where id = @p_apu_subtitulo_id)

    RETURN  @v_id

END
















CREATE FUNCTION [dbo].[_Apu_Rubro_Apu_Subtitulo_Id]
(
	@p_apu_rubro_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_apu_subtitulo_id varchar(17)

	select  @v_apu_subtitulo_id = 
            (select apu_subtitulo_id 
             from  apu_rubro
             where id = @p_apu_rubro_id)

    RETURN  @v_apu_subtitulo_id

END
















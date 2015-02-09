CREATE FUNCTION [dbo].[_Apu_Proyecto_Rubro_Apu_Subtitulo_Id_1]
(
	@p_Apu_Proyecto_id varchar(17),
	@p_Apu_Rubro_id varchar(17)

)
RETURNS varchar(17)
BEGIN
    
    declare 
      @v_apu_subtitulo_id varchar(17)
     
      select  @v_apu_subtitulo_id =
            (select apu_subtitulo_id
             from  apu_proyecto_rubro
             where Apu_Proyecto_Id = @p_Apu_Proyecto_id
			 and Apu_Rubro_Id= @p_Apu_Rubro_id)
      
    return  @v_apu_subtitulo_id

END
















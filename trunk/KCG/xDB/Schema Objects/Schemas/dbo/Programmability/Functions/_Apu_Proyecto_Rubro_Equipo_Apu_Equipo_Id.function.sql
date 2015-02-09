create FUNCTION [dbo].[_Apu_Proyecto_Rubro_Equipo_Apu_Equipo_Id]
(
	@p_apu_proyecto_rubro_equipo_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare 
      @v_apu_equipo_id varchar(17)
     
      select  @v_apu_equipo_id =
            (select apu_equipo_id
             from  apu_proyecto_rubro_equipo
             where id = @p_apu_proyecto_rubro_equipo_id)
      
    RETURN  @v_apu_equipo_id

END














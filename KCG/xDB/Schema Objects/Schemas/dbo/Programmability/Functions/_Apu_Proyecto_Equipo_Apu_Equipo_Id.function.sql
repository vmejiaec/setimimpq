CREATE FUNCTION [dbo].[_Apu_Proyecto_Equipo_Apu_Equipo_Id]
(
	@p_apu_proyecto_Equipo_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_apu_Equipo_id varchar(17)

	select  @v_apu_Equipo_id = 
            (select apu_Equipo_id 
             from  apu_proyecto_Equipo
             where id = @p_apu_proyecto_Equipo_id)

    RETURN  @v_apu_Equipo_id

END











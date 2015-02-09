CREATE FUNCTION [dbo].[_Apu_Proyecto_Equipo_Id1]
(
	@p_apu_proyecto_id varchar(17),
    @p_apu_equipo_Id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_Id varchar(17)
              
	select  @v_Id = 
            (select id 
             from  apu_proyecto_equipo
             where apu_proyecto_id = @p_apu_proyecto_id
             and apu_equipo_id = @p_apu_equipo_id)

    RETURN  @v_Id

END





CREATE FUNCTION [dbo].[_Apu_Equipo_Nombre]
(
	@p_apu_equipo_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  apu_equipo 
             where id = @p_apu_equipo_id)

    RETURN  @v_nombre

END













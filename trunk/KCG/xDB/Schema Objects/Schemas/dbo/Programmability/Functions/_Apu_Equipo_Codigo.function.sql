CREATE FUNCTION [dbo].[_Apu_Equipo_Codigo]
(
	@p_apu_equipo_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  apu_equipo
             where id = @p_apu_equipo_id)

    RETURN  @v_codigo

END
















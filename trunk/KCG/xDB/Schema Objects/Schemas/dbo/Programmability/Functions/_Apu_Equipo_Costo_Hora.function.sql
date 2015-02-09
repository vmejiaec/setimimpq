CREATE FUNCTION [dbo].[_Apu_Equipo_Costo_Hora]
(
	@p_apu_equipo_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
   declare 
          @v_apu_equipo_costo_diario numeric(17,4),
          @v_Costo_hora   numeric(17,4),
          @v_hora int
 
 set @v_hora = 8
 exec @v_apu_equipo_costo_diario = dbo._apu_equipo_costo_total @p_apu_equipo_id
 exec @v_costo_hora =  dbo.__division_cuatro_decimales @v_apu_equipo_costo_diario, @v_hora
                           
 return  @v_costo_hora

END




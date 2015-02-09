CREATE FUNCTION [dbo].[_Apu_Proyecto_Equipo_Costo_Total_Indice]
(
	@p_apu_proyecto_id varchar(17),
    @p_apu_indice_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
            @v_total numeric(17,4)

	select  @v_total = 
    (
		  select sum(dbo.__porcentaje_cuatro_decimales(
			(dbo._apu_proyecto_Equipo_cantidad_Equipo_x_costo 
				(dbo._apu_proyecto_equipo_apu_proyecto_id (apu_proyecto_equipo_id),
				dbo._apu_proyecto_equipo_apu_equipo_id (apu_proyecto_equipo_id))),
             porcentaje)   )
		from apu_proyecto_equipo_indice
		where dbo._apu_proyecto_equipo_apu_proyecto_id (apu_proyecto_equipo_id) = @p_apu_proyecto_id
		and apu_indice_id = @p_apu_indice_id)
    

    RETURN  isnull(@v_total,0)

END












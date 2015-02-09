
-- Esta funcion es utilizada en la formula de Equipo

create FUNCTION [dbo].[_Apu_Proyecto_Equipo_Cantidad_Equipo_X_Costo]
(
	@p_apu_proyecto_id varchar(17),
    @p_apu_equipo_id   varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
            @v_total numeric(17,4)

	select  @v_total = 
    (
		select
		  sum(
			   dbo.__multiplicar_cuatro_decimales_2
			   (
				   dbo._apu_proyecto_rubro_equipo_costo_x_rendimiento (id,@p_apu_proyecto_id),
				   dbo._apu_proyecto_rubro_cantidad (apu_proyecto_rubro_id)
			   )
			 )
		from apu_proyecto_rubro_equipo
		where dbo._apu_proyecto_rubro_apu_proyecto_id (apu_proyecto_rubro_id) = @p_apu_proyecto_id 
		and apu_equipo_id = @p_apu_equipo_id)

    RETURN  isnull(@v_total,0)


END



















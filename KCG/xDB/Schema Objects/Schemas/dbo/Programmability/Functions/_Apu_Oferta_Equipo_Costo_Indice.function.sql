﻿CREATE FUNCTION [dbo].[_Apu_Oferta_Equipo_Costo_Indice]
(
	@p_apu_Oferta_id varchar(17),
    @p_apu_indice_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
            @v_total numeric(17,4)

    set @v_total = 0

	select  @v_total = (
       select sum(dbo.__porcentaje_cuatro_decimales(
			(dbo._Apu_Oferta_Rubro_Costo_Equipo1 
				(dbo._apu_oferta_equipo_apu_oferta_id (apu_oferta_equipo_id),
				dbo._apu_oferta_equipo_apu_equipo_id (apu_oferta_equipo_id))),
             porcentaje)   )
		from apu_oferta_equipo_indice
		where dbo._apu_oferta_equipo_apu_oferta_id (apu_oferta_equipo_id) = @p_apu_oferta_id
		and apu_indice_id = @p_apu_indice_id)

              

    RETURN  isnull(@v_total,0)

END














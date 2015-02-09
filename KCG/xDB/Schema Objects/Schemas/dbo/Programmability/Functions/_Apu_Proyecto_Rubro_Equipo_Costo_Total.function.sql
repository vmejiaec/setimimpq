﻿
create FUNCTION [dbo].[_Apu_Proyecto_Rubro_Equipo_Costo_Total]
(
	@p_apu_proyecto_rubro_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_costo_total numeric(17,4),
      @v_apu_proyecto_id varchar(17),
      @v_apu_Equipo_id varchar(17),
      @v_apu_proyecto_Equipo_id varchar(17)

     exec @v_apu_proyecto_id 
          = dbo._apu_proyecto_rubro_apu_proyecto_id @p_apu_proyecto_rubro_id
     

     select  @v_costo_total = 
				(select 
					isnull(sum (dbo._apu_proyecto_rubro_equipo_costo_x_rendimiento (id,@v_apu_proyecto_id )),0)total
					from  apu_proyecto_rubro_Equipo 
					where apu_proyecto_rubro_id = @p_apu_proyecto_rubro_id)
      
    RETURN  @v_costo_total

END









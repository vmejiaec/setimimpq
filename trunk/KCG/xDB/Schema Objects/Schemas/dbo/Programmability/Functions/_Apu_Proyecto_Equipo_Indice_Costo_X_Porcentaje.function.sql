-- Esta funcion es utilizada en la formula de Equipo Indice

create FUNCTION [dbo].[_Apu_Proyecto_Equipo_Indice_Costo_X_Porcentaje]
(
	@p_apu_proyecto_Equipo_Indice_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_apu_proyecto_equipo_Id varchar(17),
      @v_apu_equipo_id varchar(17),
      @v_apu_proyecto_id varchar(17),
      @v_costo numeric (17,4),
      @v_porcentaje numeric(5,2),
      @v_total numeric(17,4)

      exec @v_apu_proyecto_equipo_id 
           = dbo._apu_proyecto_Equipo_indice_apu_proyecto_equipo_id @p_apu_proyecto_Equipo_Indice_id

      exec @v_apu_equipo_id 
           = dbo._apu_proyecto_equipo_apu_equipo_id @v_apu_proyecto_equipo_id
             
      exec @v_apu_proyecto_id 
           = dbo._apu_proyecto_equipo_apu_proyecto_id @v_apu_proyecto_equipo_id
      
	  exec @v_costo
           = dbo._apu_proyecto_Equipo_cantidad_Equipo_x_costo @v_apu_proyecto_id, @v_apu_equipo_id
      
      exec @v_porcentaje 
           = dbo._apu_proyecto_Equipo_Indice_Porcentaje @p_apu_proyecto_Equipo_Indice_id
      
      exec @v_total 
            = dbo.__porcentaje_cuatro_decimales @v_costo, @v_porcentaje
      
    return  @v_total

END

















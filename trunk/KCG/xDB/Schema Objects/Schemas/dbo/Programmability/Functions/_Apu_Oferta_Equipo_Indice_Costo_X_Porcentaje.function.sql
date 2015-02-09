-- Esta funcion es utilizada en la formula de Equipo Indice

create FUNCTION [dbo].[_Apu_Oferta_Equipo_Indice_Costo_X_Porcentaje]
(
	@p_apu_Oferta_Equipo_Indice_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_apu_Oferta_equipo_Id varchar(17),
      @v_apu_oferta_id varchar(17),
      @v_apu_equipo_id varchar(17),
      @v_costo numeric (17,4),
      @v_porcentaje numeric(5,2),
      @v_total numeric(17,4)

      exec @v_apu_Oferta_equipo_id 
           = dbo._apu_Oferta_Equipo_indice_apu_Oferta_equipo_id @p_apu_Oferta_Equipo_Indice_id

      exec @v_apu_oferta_id 
           = dbo._Apu_oferta_equipo_Apu_oferta_id @v_apu_Oferta_equipo_id 

      exec @v_apu_equipo_id
           = dbo._Apu_oferta_equipo_Apu_equipo_id @v_apu_Oferta_equipo_id 

      exec @v_costo
           = dbo._Apu_Oferta_Rubro_Costo_Equipo1 @v_apu_oferta_id, @v_apu_equipo_id
      
      exec @v_porcentaje 
           = dbo._apu_Oferta_Equipo_Indice_Porcentaje @p_apu_Oferta_Equipo_Indice_id
      
      exec @v_total 
            = dbo.__porcentaje_cuatro_decimales @v_costo, @v_porcentaje
      
    return  isnull(@v_total,0)

END


















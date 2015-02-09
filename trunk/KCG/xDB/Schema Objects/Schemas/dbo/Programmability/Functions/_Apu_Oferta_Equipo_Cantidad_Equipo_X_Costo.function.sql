-- Esta funcion es utilizada en la formula de Equipo
create FUNCTION [dbo].[_Apu_Oferta_Equipo_Cantidad_Equipo_X_Costo]
(
	@p_apu_Oferta_Equipo_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_apu_Oferta_id varchar(17),
      @v_apu_Equipo_id varchar(17),
      @v_costo numeric (17,4)
     
      exec @v_apu_oferta_id 
           = dbo._Apu_oferta_equipo_Apu_oferta_id @p_apu_Oferta_equipo_id 

      exec @v_apu_equipo_id
           = dbo._Apu_oferta_equipo_Apu_equipo_id @p_apu_Oferta_equipo_id 

      exec @v_costo
           = dbo._Apu_Oferta_Rubro_Costo_Equipo1 @v_apu_oferta_id, @v_apu_equipo_id
     
    return  isnull(@v_costo,0)

END
















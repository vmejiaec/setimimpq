CREATE FUNCTION [dbo].[_Apu_Rubro_Rendimiento_Equipo_Hora]
(
	@p_apu_rubro_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
        @v_apu_rubro_rendimiento_equipo numeric(17,6),
        @v_horas int,
        @v_resultado numeric(17,6)

    set @v_horas = 8
    exec @v_apu_rubro_rendimiento_equipo = dbo._apu_rubro_rendimiento_equipo @p_apu_rubro_id
    
   if ( @v_apu_rubro_rendimiento_equipo = 0 )
      set @v_resultado = 0
   else
	set @v_resultado = 
           (dbo.__division_seis_decimales 
                 (@v_horas, 
                  isnull(@v_apu_rubro_rendimiento_equipo,0)))
            
    RETURN  isnull(@v_resultado,0)

END
















CREATE FUNCTION [dbo].[_Apu_Rubro_Rendimiento_Equipo_Hora_R]
(
	@p_apu_rubro_rendimiento_equipo numeric(17,6)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
        @v_horas int,
        @v_resultado numeric(17,6)

    set @v_horas = 8
    
   if ( @p_apu_rubro_rendimiento_equipo = 0 )
      set @v_resultado = 0
   else
	set @v_resultado = 
           (dbo.__division_seis_decimales 
                 (@v_horas, 
                  isnull(@p_apu_rubro_rendimiento_equipo,0)))
            
    RETURN  isnull(@v_resultado,0)

END


















CREATE FUNCTION [dbo].[_Apu_Proyecto_Rubro_Rendimiento_Mano_Obra_Hora]
(
	@p_apu_proyecto_rubro_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
        @v_apu_proyecto_rubro_rendimiento_mano_obra numeric(17,6),
        @v_horas int,
        @v_resultado numeric(17,6)

    set @v_horas = 8
    set @v_resultado = 0;
    exec @v_apu_proyecto_rubro_rendimiento_mano_obra = dbo._apu_proyecto_rubro_rendimiento_mano_obra @p_apu_proyecto_rubro_id

    if (isnull(@v_apu_proyecto_rubro_rendimiento_mano_obra,0) <> 0)
    begin
		set @v_resultado = 
           (dbo.__division_seis_decimales 
                 (@v_horas, 
                  @v_apu_proyecto_rubro_rendimiento_mano_obra))
    end
        
    RETURN  @v_resultado

END



















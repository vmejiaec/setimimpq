CREATE FUNCTION [dbo].[_Apu_Rubro_Costo_Directo]
(
	@p_apu_rubro_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_apu_rubro_material_costo_total numeric(17,4),
      @v_apu_rubro_mano_obra_costo_total numeric(17,4),
      @v_apu_rubro_equipo_costo_total numeric(17,4),
      @v_apu_rubro_transporte_costo_total numeric(17,4),
      @v_total numeric (17,4)
    
   exec @v_apu_rubro_material_costo_total = _apu_rubro_material_costo_total @p_apu_rubro_id
   exec @v_apu_rubro_mano_obra_costo_total = _apu_rubro_mano_obra_costo_total_rendimiento @p_apu_rubro_id
   exec @v_apu_rubro_equipo_costo_total = _apu_rubro_equipo_costo_total_rendimiento @p_apu_rubro_id
   exec @v_apu_rubro_transporte_costo_total = _apu_rubro_transporte_costo_total @p_apu_rubro_id
   
   set @v_total = 
           (dbo.__suma_cuatro_decimales_4(
            @v_apu_rubro_material_costo_total ,
            @v_apu_rubro_mano_obra_costo_total ,
            @v_apu_rubro_equipo_costo_total ,
            @v_apu_rubro_transporte_costo_total))

    RETURN  isnull(@v_total,0)

END


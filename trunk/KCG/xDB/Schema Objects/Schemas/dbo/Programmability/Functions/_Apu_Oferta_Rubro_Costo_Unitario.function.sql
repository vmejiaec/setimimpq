 
CREATE FUNCTION [dbo].[_Apu_Oferta_Rubro_Costo_Unitario]
(
	@p_apu_Oferta_rubro_id varchar(17)
)
RETURNS numeric (17,4)
BEGIN
    
    declare 
       @v_equipo     numeric(17,4),
       @v_material   numeric(17,4),
       @v_transporte numeric(17,4),
       @v_mano_obra  numeric(17,4),
       @v_resultado  numeric(17,4),
	   @v_apu_oferta_id varchar(17),
	   @v_indirecto  numeric(17,4),
	   @v_porcentaje numeric(5,2)
              

--    exec @v_material   = dbo._apu_Oferta_rubro_costo_material   @p_apu_Oferta_rubro_id
--    exec @v_transporte = dbo._apu_Oferta_rubro_costo_transporte @p_apu_Oferta_rubro_id
--    exec @v_mano_obra  = dbo._apu_Oferta_rubro_costo_mano_obra  @p_apu_Oferta_rubro_id
--    exec @v_equipo     = dbo._apu_Oferta_rubro_costo_equipo     @p_apu_Oferta_rubro_id

--    exec @v_resultado = dbo.__suma_cuatro_decimales_4 
--                              @v_material,
--                              @v_transporte,
--                              @v_mano_obra,
--                              @v_equipo 
-- -----------------------------------------------------------------------------
    set @v_material   = (select sum(dbo._Apu_Oferta_Rubro_Material_Costo (id))
						 from  apu_Oferta_rubro_Material
						 where apu_Oferta_rubro_id = @p_apu_Oferta_Rubro_id)
	set @v_transporte = 0.0
	set @v_mano_obra  = (select sum(dbo._Apu_Oferta_Rubro_Mano_Obra_Costo (id))
						 from  apu_Oferta_rubro_Mano_Obra
						 where apu_Oferta_rubro_id = @p_apu_Oferta_Rubro_id)
	set @v_equipo     = (select sum(dbo._Apu_Oferta_Rubro_Equipo_Costo (id))
						 from  apu_Oferta_rubro_equipo 
						 where apu_Oferta_rubro_id = @p_apu_Oferta_Rubro_id)

	set @v_resultado = isnull(@v_material,0) + isnull(@v_transporte,0) + isnull(@v_mano_obra,0) + isnull(@v_equipo,0)
-- -----------------------------------------------------------------------------
    set @v_apu_oferta_id = dbo._apu_oferta_rubro_apu_oferta_id (@p_apu_oferta_rubro_id)
    set @v_porcentaje = dbo._apu_oferta_Porcentaje_Costo_Indirecto_Otros (@v_apu_oferta_id)    

    set @v_indirecto = dbo.__porcentaje_cuatro_decimales (@v_resultado, @v_porcentaje) 
 
    set @v_resultado = isnull(@v_resultado,0) + isnull(@v_indirecto,0)

    return round(@v_resultado,2)

END
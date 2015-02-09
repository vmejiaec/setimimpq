-- Esta funcion devuelve la sumatoria de la CANTIDAD de material 
-- utilizada en todo la Oferta.
CREATE FUNCTION [dbo].[_Apu_Oferta_Indice_Costo]
(
	@p_apu_Oferta_id varchar(17),
    @p_apu_indice_id varchar(17)
)
RETURNS numeric(17,2)
BEGIN
    
    declare 
      @v_material numeric(17,4),
      @v_transporte numeric(17,4),
      @v_mano_obra numeric(17,4),
      @v_equipo numeric(17,4),
      @v_total numeric (17,4)

  exec @v_material 
      = dbo._Apu_Oferta_Material_Costo_Indice
               @p_apu_Oferta_id,
               @p_apu_indice_id

  exec @v_transporte
      = dbo._Apu_Oferta_Transporte_Costo_Indice
               @p_apu_Oferta_id,
               @p_apu_indice_id

  exec @v_mano_obra
      = dbo._Apu_Oferta_Mano_Obra_Costo_Indice
               @p_apu_Oferta_id,
               @p_apu_indice_id

  exec @v_equipo
      = dbo._Apu_Oferta_Equipo_Costo_Indice
               @p_apu_Oferta_id,
               @p_apu_indice_id

  exec @v_total = dbo.__suma_cuatro_decimales_4 
                    @v_material, 
                    @v_transporte,
                    @v_mano_obra,
                    @v_equipo

  return  isnull(@v_total,0)

END
















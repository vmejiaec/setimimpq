
CREATE FUNCTION [dbo].[_Apu_Oferta_Costo_Mano_Obra_Cuadrilla]
(
	@p_apu_Oferta_id varchar(17)
)
RETURNS numeric(17,2)
BEGIN
    
    declare 
      @v_costo_mano_obra numeric(17,4),
      @v_costo_indice numeric (17,4),
      @v_resultado numeric (17,4)

      
    exec @v_costo_mano_obra = dbo._Apu_Oferta_Costo_Mano_Obra @p_apu_Oferta_id      


    exec  @v_costo_indice = dbo._apu_Oferta_costo_indice_equipo @p_apu_Oferta_id

   
    exec @v_resultado = dbo.__suma_cuatro_decimales_2 @v_costo_mano_obra, @v_costo_indice
 
    return isnull(@v_resultado,0)

END







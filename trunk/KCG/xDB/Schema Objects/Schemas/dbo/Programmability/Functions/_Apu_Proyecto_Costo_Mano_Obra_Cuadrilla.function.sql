CREATE FUNCTION [dbo].[_Apu_Proyecto_Costo_Mano_Obra_Cuadrilla]
(
	@p_apu_proyecto_id varchar(17)
)
RETURNS numeric(17,2)
BEGIN
    
    declare 
      @v_resultado numeric (17,2)

    select  @v_resultado = 
    (
		select 
		dbo._Apu_Proyecto_Mano_Obra_Costo_Total_Indice(@p_apu_proyecto_id, apu_indice_id)
		from apu_proyecto_mano_obra
		where apu_proyecto_id = @p_apu_proyecto_id
		group by apu_indice_id
	)
    return isnull(@v_resultado,0)

END











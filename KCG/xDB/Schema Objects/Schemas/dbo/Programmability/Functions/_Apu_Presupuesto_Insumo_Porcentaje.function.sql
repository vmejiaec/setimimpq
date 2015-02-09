CREATE FUNCTION [dbo].[_Apu_Presupuesto_Insumo_Porcentaje]
(
	@p_apu_indice_id varchar(17),
	@p_apu_insumo_id varchar(17)
)
RETURNS  numeric(17,4)
BEGIN
    
    declare @v_porcentaje numeric(17,4)

	select  @v_porcentaje = 
            (   Select Porcentaje
				from Apu_Presupuesto_Indice
				where  apu_indice_id = @p_apu_indice_id
				and Apu_Insumo_Id= @p_apu_insumo_id)

    RETURN  @v_porcentaje

END












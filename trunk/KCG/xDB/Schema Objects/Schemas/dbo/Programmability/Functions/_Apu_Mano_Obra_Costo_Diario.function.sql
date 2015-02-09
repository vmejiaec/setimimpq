CREATE FUNCTION [dbo].[_Apu_Mano_Obra_Costo_Diario]
(
	@p_apu_Mano_Obra_id varchar(17)
)
RETURNS numeric(17, 4)
BEGIN
    
    declare @v_costo_diario numeric(17, 4)

	select  @v_costo_diario = 
            (select costo_diario 
             from  apu_Mano_Obra
             where id = @p_apu_Mano_Obra_id)

    RETURN @v_costo_diario

END

















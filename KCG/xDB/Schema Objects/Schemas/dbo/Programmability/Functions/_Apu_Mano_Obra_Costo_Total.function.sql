CREATE FUNCTION [dbo].[_Apu_Mano_Obra_Costo_Total]
(
	@p_apu_mano_obra_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_Costo_Diario numeric(17,4)
              

	select  @v_Costo_Diario = 
            (select costo_diario
             from  apu_mano_obra
             where id = @p_apu_mano_obra_id)

    RETURN  @v_Costo_Diario

END



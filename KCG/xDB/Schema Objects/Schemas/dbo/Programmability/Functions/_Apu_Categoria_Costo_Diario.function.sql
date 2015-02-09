create FUNCTION [dbo].[_Apu_Categoria_Costo_Diario]
(
	@p_apu_categoria_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_costo_diario numeric(17,4)

	select  @v_costo_diario = 
            (select costo_diario 
             from  apu_categoria
             where id = @p_apu_categoria_id)

    RETURN  @v_costo_diario

END

















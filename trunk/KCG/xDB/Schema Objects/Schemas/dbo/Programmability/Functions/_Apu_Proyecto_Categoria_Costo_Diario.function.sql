CREATE FUNCTION [dbo].[_Apu_Proyecto_Categoria_Costo_Diario]
(
	@p_apu_proyecto_categoria_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_costo_diario numeric(17,4)

	select  @v_costo_diario = 
            (select costo_diario 
             from  apu_proyecto_categoria
             where id = @p_apu_proyecto_categoria_id)

    RETURN  isnull(@v_costo_diario,0)

END


















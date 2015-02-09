CREATE FUNCTION [dbo].[_Apu_Mano_Obra_Apu_Categoria_Id]
(
	@p_apu_mano_obra_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_apu_categoria_id varchar(17)

	select  @v_apu_categoria_id = 
            (select apu_categoria_id 
             from  apu_mano_obra
             where id = @p_apu_mano_obra_id)

    RETURN  @v_apu_categoria_id

END












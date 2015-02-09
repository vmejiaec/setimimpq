CREATE FUNCTION [dbo].[_Apu_Categoria_Codigo]
(
	@p_apu_categoria_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  apu_categoria
             where id = @p_apu_categoria_id)

    RETURN  @v_codigo

END















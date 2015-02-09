CREATE FUNCTION [dbo].[_Apu_Categoria_Nombre]
(
	@p_apu_categoria_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  apu_categoria 
             where id = @p_apu_categoria_id)

    RETURN  @v_nombre

END












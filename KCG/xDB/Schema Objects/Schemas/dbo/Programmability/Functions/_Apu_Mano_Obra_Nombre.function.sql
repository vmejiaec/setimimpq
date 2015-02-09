CREATE FUNCTION [dbo].[_Apu_Mano_Obra_Nombre]
(
	@p_Apu_Mano_Obra_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  Apu_Mano_Obra
             where id = @p_apu_Mano_Obra_id)

    RETURN  @v_nombre

END












CREATE FUNCTION [dbo].[_Apu_Titulo_Nombre]
(
	@p_apu_titulo_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  apu_titulo 
             where id = @p_apu_titulo_id)

    RETURN  @v_nombre

END











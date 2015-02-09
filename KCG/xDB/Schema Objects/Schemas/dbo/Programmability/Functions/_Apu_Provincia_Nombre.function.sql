CREATE FUNCTION [dbo].[_Apu_Provincia_Nombre]
(
	@p_apu_provincia_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  apu_provincia 
             where id = @p_apu_provincia_id)

    RETURN  @v_nombre

END










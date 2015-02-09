CREATE FUNCTION [dbo].[_Apu_Lugar_Nombre]
(
	@p_apu_Lugar_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  apu_lugar 
             where id = @p_apu_lugar_id)

    RETURN  @v_nombre

END













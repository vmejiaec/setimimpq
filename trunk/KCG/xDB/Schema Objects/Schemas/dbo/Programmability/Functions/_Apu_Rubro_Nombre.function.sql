CREATE FUNCTION [dbo].[_Apu_Rubro_Nombre]
(
	@p_apu_rubro_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  apu_rubro
             where id = @p_apu_rubro_id)

    RETURN  @v_nombre

END













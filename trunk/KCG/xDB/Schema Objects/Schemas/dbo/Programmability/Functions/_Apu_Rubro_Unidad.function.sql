CREATE FUNCTION [dbo].[_Apu_Rubro_Unidad]
(
	@p_apu_rubro_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_unidad varchar(200)

	select  @v_unidad = 
            (select unidad 
             from  apu_rubro
             where id = @p_apu_rubro_id)

    RETURN  @v_unidad

END


CREATE FUNCTION [dbo].[_Apu_Oferta_Rubro_Codigo]
(
	@p_apu_Oferta_rubro_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  apu_Oferta_rubro
             where id = @p_apu_Oferta_rubro_id)

    RETURN  @v_codigo

END















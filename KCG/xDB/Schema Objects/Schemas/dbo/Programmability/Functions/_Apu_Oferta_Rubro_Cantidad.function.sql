CREATE FUNCTION [dbo].[_Apu_Oferta_Rubro_Cantidad]
(
	@p_apu_Oferta_rubro_id varchar(17)
)
RETURNS NUMERIC (17,4)
BEGIN
    
    declare @v_cantidad numeric (17,4)

	select  @v_cantidad = 
            (select cantidad 
             from  Apu_Oferta_rubro
             where id = @p_apu_Oferta_rubro_id)

    RETURN  @v_cantidad

END
















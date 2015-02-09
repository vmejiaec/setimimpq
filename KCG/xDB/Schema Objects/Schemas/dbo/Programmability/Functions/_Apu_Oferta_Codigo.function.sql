CREATE FUNCTION [dbo].[_Apu_Oferta_Codigo]
(
	@p_apu_Oferta_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  apu_Oferta
             where id = @p_apu_Oferta_id)

    RETURN  @v_codigo

END

















CREATE FUNCTION [dbo].[_Apu_Lugar_Codigo]
(
	@p_Apu_Lugar_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  apu_Lugar
             where id = @p_apu_Lugar_id)

    RETURN  @v_codigo

END














CREATE FUNCTION [dbo].[_Apu_Provincia_Codigo]
(
	@p_apu_provincia_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  apu_provincia
             where id = @p_apu_provincia_id)

    RETURN  @v_codigo

END













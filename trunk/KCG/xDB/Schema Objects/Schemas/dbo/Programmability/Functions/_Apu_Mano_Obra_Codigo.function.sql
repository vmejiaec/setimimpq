CREATE FUNCTION [dbo].[_Apu_Mano_Obra_Codigo]
(
	@p_apu_Mano_Obra_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  apu_Mano_Obra
             where id = @p_apu_Mano_Obra_id)

    RETURN @v_codigo

END
















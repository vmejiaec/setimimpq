CREATE FUNCTION [dbo].[_Apu_Material_Codigo]
(
	@p_Apu_Material_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  apu_Material
             where id = @p_apu_Material_id)

    RETURN  @v_codigo

END














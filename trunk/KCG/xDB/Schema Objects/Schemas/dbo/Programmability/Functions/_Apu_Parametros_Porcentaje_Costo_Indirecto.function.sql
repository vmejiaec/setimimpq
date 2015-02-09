create FUNCTION [dbo].[_Apu_Parametros_Porcentaje_Costo_Indirecto]
(
	@p_int_sucursal_id varchar(17)
)
RETURNS numeric (5,2)
BEGIN
    
    declare @v_apu_porcentaje_costo_indirecto numeric(5,2)

	select  @v_apu_porcentaje_costo_indirecto = 
            (select porcentaje_costo_indirecto 
             from  apu_parametros 
             where int_sucursal_id = @p_int_sucursal_id)

    RETURN  @v_apu_porcentaje_costo_indirecto

END









create FUNCTION [dbo].[_Apu_Proyecto_Porcentaje_Costo_Indirecto]
(
	@p_apu_proyecto_id varchar(17)
)
RETURNS numeric (5,2)
BEGIN
    
    declare @v_porcentaje_costo_indirecto numeric(5,2)

	select  @v_porcentaje_costo_indirecto = 
            (select porcentaje_costo_indirecto 
             from  apu_proyecto
             where id = @p_apu_proyecto_id)

    RETURN  @v_porcentaje_costo_indirecto

END

















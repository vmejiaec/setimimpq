create FUNCTION [dbo].[_Apu_Proyecto_Porcentaje_Costo_Otros]
(
	@p_apu_proyecto_id varchar(17)
)
RETURNS numeric(5,2)
BEGIN
    
    declare @v_porcentaje_costo_otros numeric(5,2)

	select  @v_porcentaje_costo_otros = 
            (select porcentaje_costo_otros
             from  apu_proyecto
             where id = @p_apu_proyecto_id)

    RETURN  @v_porcentaje_costo_otros

END












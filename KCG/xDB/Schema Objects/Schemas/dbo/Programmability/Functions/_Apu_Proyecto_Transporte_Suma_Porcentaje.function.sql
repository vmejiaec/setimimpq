CREATE FUNCTION [dbo].[_Apu_Proyecto_Transporte_Suma_Porcentaje]
(
	@p_apu_proyecto_id varchar(17)
)
RETURNS numeric(5,2)
BEGIN
    
    declare @v_suma_porcentaje numeric(5,2)
              
	select  @v_suma_porcentaje = 
            (select isnull(sum (porcentaje),0)
             from  apu_proyecto_transporte_indice
             where apu_proyecto_id = @p_apu_proyecto_id)

    RETURN  @v_suma_porcentaje

END








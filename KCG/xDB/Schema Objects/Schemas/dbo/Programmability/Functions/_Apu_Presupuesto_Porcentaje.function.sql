CREATE FUNCTION [dbo].[_Apu_Presupuesto_Porcentaje]
(
	@p_apu_Origen_id varchar(17)
)
RETURNS numeric(5,2)
BEGIN
    
    declare @v_porcentaje numeric(5,2)

	select  @v_porcentaje = 
            (select Porcentaje_Costo_Indirecto
             from  apu_presupuesto
             where Apu_Origen_id = @p_apu_Origen_id)

    return  @v_porcentaje

END


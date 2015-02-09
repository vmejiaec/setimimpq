CREATE FUNCTION [dbo].[_Apu_Presupuesto_Cuadrilla_Coeficiente]
(
	@p_apu_Presupuesto_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_coeficiente numeric(17,4)

	select  @v_coeficiente = 
            (select Sum(Coeficiente)
             from  apu_presupuesto_Cuadrilla
             where Apu_Presupuesto_id = @p_apu_Presupuesto_id)

    return  isnull( @v_coeficiente,0)

END




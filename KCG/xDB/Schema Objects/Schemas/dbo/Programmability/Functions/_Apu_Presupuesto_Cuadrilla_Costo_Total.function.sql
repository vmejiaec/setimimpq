CREATE FUNCTION [dbo].[_Apu_Presupuesto_Cuadrilla_Costo_Total]
(
	@p_Apu_Presupuesto_id varchar(17),
	@p_Estado char(3)
	
)
RETURNS numeric(17,3)
BEGIN
    
    declare @v_costo_total numeric(17,3)

	select  @v_costo_total = 
            (select round(Sum(isnull(round(Coeficiente * Costo_Actual,3),0)),3)
             from  Apu_presupuesto_Cuadrilla
             where Apu_Presupuesto_id = @p_apu_Presupuesto_id
			 and Estado = @p_Estado 
			 )
    return  isnull(@v_costo_total,0.000)

END


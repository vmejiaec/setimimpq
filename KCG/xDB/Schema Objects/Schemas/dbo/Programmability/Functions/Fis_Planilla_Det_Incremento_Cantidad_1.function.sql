-- Incremento  Cantidad =
		--if (Cantidad_Presupuesto < Cantidad_Anterior)
		--	Cantidad_Incremento = Cantidad_Actual
		--else if (cantidad_total - Cantidad_presupuesto) < 0
		--	Cantidad_Incremento = 0
		--else 
		--	Cantidad_Incremento = Cantidad_Total - Cantidad_Presupuesto
CREATE FUNCTION [dbo].[Fis_Planilla_Det_Incremento_Cantidad_1]
(
	@p_Cantidad_Anterior numeric(17,2),
	@p_Cantidad_Presupuesto numeric(17,2),
	@p_Cantidad_Actual numeric(17,2),
	@p_Cantidad_Total numeric(17,4)
)
RETURNS numeric(17,2)
BEGIN
    declare @v_Cantidad_Incremento numeric(17,2)

	if (@p_Cantidad_Presupuesto < @p_Cantidad_Anterior)
	  set @v_Cantidad_Incremento = @p_Cantidad_Actual;
	else
		if (@p_Cantidad_Total - @p_Cantidad_Presupuesto) < 0
			set @v_Cantidad_Incremento = 0
	else 
			set @v_Cantidad_Incremento =  @p_Cantidad_Total - @p_Cantidad_Presupuesto;

	return @v_Cantidad_Incremento;
	
END
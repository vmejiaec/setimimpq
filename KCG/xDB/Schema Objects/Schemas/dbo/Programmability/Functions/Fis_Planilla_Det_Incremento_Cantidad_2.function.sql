-- Incremento Cantidad Acumulado = 
--Incremento_Cantidad_2 =
--(
--Incremento_Cantidad_1
--+
	--if (Cantidad_anterior > Cantidad_Prespuesto)
		--Cantidad_Anterior  - Cantidad_Presupuesto
	--Else
			--0
--)
CREATE FUNCTION [dbo].[Fis_Planilla_Det_Incremento_Cantidad_2]
(
	@p_Cantidad_Anterior numeric(17,2),
	@p_Cantidad_Presupuesto numeric(17,2),
	@p_Cantidad_Incremento_1 numeric(17,4)

)
RETURNS numeric(17,2)
BEGIN
    declare 
		@v_Cantidad_Incremento_Cantidad_Ant numeric(17,2),
		@v_Cantidad_Incremento_Acumulado numeric(17,2);


	if (@p_Cantidad_Anterior > @p_Cantidad_Presupuesto)
	  set @v_Cantidad_Incremento_Cantidad_Ant = @p_Cantidad_Anterior - @p_Cantidad_Presupuesto;
	else 
	  set @v_Cantidad_Incremento_Cantidad_Ant = 0.00

	
	Set @v_Cantidad_Incremento_Acumulado = @p_Cantidad_Incremento_1 + @v_Cantidad_Incremento_Cantidad_Ant
	return @v_Cantidad_Incremento_Acumulado;
	
END
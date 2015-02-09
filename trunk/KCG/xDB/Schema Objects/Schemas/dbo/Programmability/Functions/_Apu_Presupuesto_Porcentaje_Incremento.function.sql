--Es la diferencia entre el monto del contrato y del monto acumulado, 
--todo dividido por el monto del contrato y multiplicado por 100. 
--Redondeado a dos decimales
CREATE FUNCTION [dbo].[_Apu_Presupuesto_Porcentaje_Incremento]
(
	@p_Apu_Presupuesto_Id varchar(17)
	
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_Apu_Presupuesto_Costo_Total numeric(17,4),
			@v_Apu_Presupuesto_Monto_Acumulado numeric(17,4),
			@v_Total numeric(17,4)


	
	set  @v_Apu_Presupuesto_Costo_Total = 
		dbo._Apu_Presupuesto_Costo_Total (@p_Apu_Presupuesto_Id);

	set @v_Apu_Presupuesto_Monto_Acumulado =
		dbo._Apu_Presupuesto_Monto_Acumulado (@p_Apu_Presupuesto_Id);

	IF ( @v_Apu_Presupuesto_Costo_Total > 0 )
		set @v_Total = 
			round(((@v_Apu_Presupuesto_Costo_Total - 
			@v_Apu_Presupuesto_Monto_Acumulado) /
			@v_Apu_Presupuesto_Costo_Total) * 100,2)
	ELSE
		set @v_Total = 0
		
    RETURN  isnull(@v_Total,0)

END

















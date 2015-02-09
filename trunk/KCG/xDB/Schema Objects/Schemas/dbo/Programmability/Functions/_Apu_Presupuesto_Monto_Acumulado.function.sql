CREATE FUNCTION [dbo].[_Apu_Presupuesto_Monto_Acumulado]
(
	@p_Apu_Presupuesto_Id varchar(17)
	
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_Apu_Presupuesto_Total numeric(17,4),
			@v_Total numeric(17,4)

		Select @v_Apu_Presupuesto_Total =
			dbo._Apu_Presupuesto_Fis_Planilla_Det_Total(@p_Apu_Presupuesto_Id); 

		Set @v_Total = @v_Apu_Presupuesto_Total + 0;
		
	
    RETURN isnull(@v_Total,0)

END

















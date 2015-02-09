CREATE FUNCTION [dbo].[Fis_Planilla_Anticipo_Devengado]
(
	@p_Apu_Presupuesto_Id varchar(17),
	@p_Tipo_Transaccion varchar(1),
	@p_Fis_Planilla_Id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_Total_Devengado numeric(17,4),
	@v_condicion_extra varchar(100)
	Set @v_condicion_extra=''

	IF(@p_Tipo_Transaccion='I')
		select  @v_Total_Devengado = 
				(select Sum(Anticipo_Devengar)
				 from Fis_Planilla
				 where Apu_Presupuesto_Id = @p_Apu_Presupuesto_Id
				 and Tipo_Planilla <>'ANT'  )
	ELSE
		select  @v_Total_Devengado = 
				(select Sum(Anticipo_Devengar)
				 from Fis_Planilla
				 where Apu_Presupuesto_Id = @p_Apu_Presupuesto_Id
				 and Tipo_Planilla <>'ANT' and Id<>@p_Fis_Planilla_Id  )


    RETURN  isnull(@v_Total_Devengado, convert (numeric(17,4),0))

END



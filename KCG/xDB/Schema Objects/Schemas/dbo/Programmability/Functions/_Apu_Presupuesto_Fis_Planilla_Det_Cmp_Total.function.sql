CREATE FUNCTION [dbo].[_Apu_Presupuesto_Fis_Planilla_Det_Cmp_Total]
(
	@p_Apu_Presupuesto_Id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_Total numeric(17,4)

		select  @v_Total = 
				(Select sum(costo * cantidad)
				From Fis_Planilla_Det
				Where Fis_Planilla_Id in
					(Select Id
					From Fis_Planilla
					Where Apu_Presupuesto_Id  = @p_Apu_Presupuesto_Id
					And Tipo_PLanilla = 'COS'))

    RETURN  isnull( @v_Total,0)

END

















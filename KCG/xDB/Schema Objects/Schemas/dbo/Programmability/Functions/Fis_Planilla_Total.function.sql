CREATE FUNCTION [dbo].[Fis_Planilla_Total]
(
	@p_Fis_Planilla_Id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_Total numeric(17,4)

	select  @v_Total = 
            (select Sum (Costo * Cantidad)
             from Fis_Planilla_Det
             where Fis_Planilla_Id = @p_Fis_Planilla_Id)

    RETURN  isnull(@v_Total, convert (numeric(17,4),0))

END

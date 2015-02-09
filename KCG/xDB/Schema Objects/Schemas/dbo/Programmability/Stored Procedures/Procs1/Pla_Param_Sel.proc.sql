CREATE PROCEDURE [dbo].Pla_Param_Sel
AS
	SET NOCOUNT ON;
SELECT        Id, Rep_Legal_Pie_Firma_Nombre, Rep_Legal_Pie_Firma_Cargo
FROM            Pla_Param
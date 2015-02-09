CREATE PROCEDURE [dbo].Pla_Param_Ins
(
	@Rep_Legal_Pie_Firma_Nombre varchar(200),
	@Rep_Legal_Pie_Firma_Cargo varchar(200)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Pla_Param] ([Rep_Legal_Pie_Firma_Nombre], [Rep_Legal_Pie_Firma_Cargo]) VALUES (@Rep_Legal_Pie_Firma_Nombre, @Rep_Legal_Pie_Firma_Cargo);
	
SELECT Id, Rep_Legal_Pie_Firma_Nombre, Rep_Legal_Pie_Firma_Cargo FROM Pla_Param WHERE (Id = SCOPE_IDENTITY())
CREATE PROCEDURE [dbo].Pla_Param_Del
(
	@Original_Id int,
	@Original_Rep_Legal_Pie_Firma_Nombre varchar(200),
	@Original_Rep_Legal_Pie_Firma_Cargo varchar(200)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Pla_Param] WHERE (([Id] = @Original_Id) AND ([Rep_Legal_Pie_Firma_Nombre] = @Original_Rep_Legal_Pie_Firma_Nombre) AND ([Rep_Legal_Pie_Firma_Cargo] = @Original_Rep_Legal_Pie_Firma_Cargo))
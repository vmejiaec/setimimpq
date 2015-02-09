CREATE PROCEDURE [dbo].Pla_Param_Upd
(
	@Rep_Legal_Pie_Firma_Nombre varchar(200),
	@Rep_Legal_Pie_Firma_Cargo varchar(200),
	@Original_Id int,
	@Original_Rep_Legal_Pie_Firma_Nombre varchar(200),
	@Original_Rep_Legal_Pie_Firma_Cargo varchar(200),
	@Id int
)
AS
	SET NOCOUNT OFF;
UPDATE [Pla_Param] SET [Rep_Legal_Pie_Firma_Nombre] = @Rep_Legal_Pie_Firma_Nombre, [Rep_Legal_Pie_Firma_Cargo] = @Rep_Legal_Pie_Firma_Cargo WHERE (([Id] = @Original_Id) AND ([Rep_Legal_Pie_Firma_Nombre] = @Original_Rep_Legal_Pie_Firma_Nombre) AND ([Rep_Legal_Pie_Firma_Cargo] = @Original_Rep_Legal_Pie_Firma_Cargo));
	
SELECT Id, Rep_Legal_Pie_Firma_Nombre, Rep_Legal_Pie_Firma_Cargo FROM Pla_Param WHERE (Id = @Id)
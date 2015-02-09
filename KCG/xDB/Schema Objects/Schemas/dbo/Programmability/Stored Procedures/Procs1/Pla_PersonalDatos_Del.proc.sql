CREATE PROCEDURE [dbo].[Pla_PersonalDatos_Del]
(
	@Original_Id int,
	@Original_Per_Personal_Id varchar(17),
	@Original_Pie_Firma_Nombre varchar(200),
	@Original_Pie_Firma_Cargo varchar(200),
	@Original_Email_Inst varchar(200),
	@Original_Pie_Firma_Iniciales varchar(200)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Pla_PersonalDatos] WHERE (([Id] = @Original_Id) AND ([Per_Personal_Id] = @Original_Per_Personal_Id) AND ([Pie_Firma_Nombre] = @Original_Pie_Firma_Nombre) AND ([Pie_Firma_Cargo] = @Original_Pie_Firma_Cargo) AND ([Email_Inst] = @Original_Email_Inst) AND ([Pie_Firma_Iniciales] = @Original_Pie_Firma_Iniciales))

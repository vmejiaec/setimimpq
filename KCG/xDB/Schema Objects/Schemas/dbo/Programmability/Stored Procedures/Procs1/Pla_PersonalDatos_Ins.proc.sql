CREATE PROCEDURE [dbo].[Pla_PersonalDatos_Ins]
(
	@Per_Personal_Id varchar(17),
	@Pie_Firma_Nombre varchar(200),
	@Pie_Firma_Cargo varchar(200),
	@Email_Inst varchar(200),
	@Pie_Firma_Iniciales varchar(200)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Pla_PersonalDatos] ([Per_Personal_Id], [Pie_Firma_Nombre], [Pie_Firma_Cargo], [Email_Inst], [Pie_Firma_Iniciales]) VALUES (@Per_Personal_Id, @Pie_Firma_Nombre, @Pie_Firma_Cargo, @Email_Inst, @Pie_Firma_Iniciales);
	
SELECT Id, Per_Personal_Id, Pie_Firma_Nombre, Pie_Firma_Cargo, Email_Inst, Pie_Firma_Iniciales FROM Pla_PersonalDatos WHERE (Id = SCOPE_IDENTITY())

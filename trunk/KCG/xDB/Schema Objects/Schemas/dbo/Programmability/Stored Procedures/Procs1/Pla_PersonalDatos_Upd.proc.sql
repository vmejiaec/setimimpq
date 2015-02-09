

CREATE PROCEDURE [dbo].[Pla_PersonalDatos_Upd]
(
	@Per_Personal_Id varchar(17),
	@Pie_Firma_Nombre varchar(200),
	@Pie_Firma_Cargo varchar(200),
	@Email_Inst varchar(200),
	@Pie_Firma_Iniciales varchar(200),
	@Original_Id int,
	@Original_Per_Personal_Id varchar(17),
	@Original_Pie_Firma_Nombre varchar(200),
	@Original_Pie_Firma_Cargo varchar(200),
	@Original_Email_Inst varchar(200),
	@Original_Pie_Firma_Iniciales varchar(200),
	@Id int
)
AS
	SET NOCOUNT OFF;
UPDATE [Pla_PersonalDatos] SET [Per_Personal_Id] = @Per_Personal_Id, [Pie_Firma_Nombre] = @Pie_Firma_Nombre, [Pie_Firma_Cargo] = @Pie_Firma_Cargo, [Email_Inst] = @Email_Inst, [Pie_Firma_Iniciales] = @Pie_Firma_Iniciales WHERE (([Id] = @Original_Id) AND ([Per_Personal_Id] = @Original_Per_Personal_Id) AND ([Pie_Firma_Nombre] = @Original_Pie_Firma_Nombre) AND ([Pie_Firma_Cargo] = @Original_Pie_Firma_Cargo) AND ([Email_Inst] = @Original_Email_Inst) AND ([Pie_Firma_Iniciales] = @Original_Pie_Firma_Iniciales));
	
SELECT Id, Per_Personal_Id, Pie_Firma_Nombre, Pie_Firma_Cargo, Email_Inst, Pie_Firma_Iniciales FROM Pla_PersonalDatos WHERE (Id = @Id)

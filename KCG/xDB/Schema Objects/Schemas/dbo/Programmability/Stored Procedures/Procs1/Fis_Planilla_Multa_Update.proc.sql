CREATE PROCEDURE dbo.Fis_Planilla_Multa_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Fis_Planilla_Id varchar(17),
	@Fis_Multa_Id varchar(17),
	@Valor numeric(17, 2),
	@Fecha smalldatetime,
	@Estado char(3),
	@Descripcion varchar(2000),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Fis_Planilla_Id varchar(17),
	@Original_Fis_Multa_Id varchar(17),
	@Original_Valor numeric(17, 2),
	@Original_Fecha smalldatetime,
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000)
)
AS
	SET NOCOUNT OFF;
UPDATE [Fis_Planilla_Multa] SET [Id] = @Id, [Codigo] = @Codigo, [Fis_Planilla_Id] = @Fis_Planilla_Id, [Fis_Multa_Id] = @Fis_Multa_Id, [Valor] = @Valor, [Fecha] = @Fecha, [Estado] = @Estado, [Descripcion] = @Descripcion WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Fis_Planilla_Id] = @Original_Fis_Planilla_Id) AND ([Fis_Multa_Id] = @Original_Fis_Multa_Id) AND ([Valor] = @Original_Valor) AND ([Fecha] = @Original_Fecha) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)));
	
SELECT Id, Codigo, Fis_Planilla_Id, Fis_Multa_Id, Valor, Fecha, Estado, Descripcion FROM Fis_Planilla_Multa WHERE (Id = @Id)
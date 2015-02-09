CREATE PROCEDURE dbo.Fis_Planilla_Multa_Delete
(
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
DELETE FROM [Fis_Planilla_Multa] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Fis_Planilla_Id] = @Original_Fis_Planilla_Id) AND ([Fis_Multa_Id] = @Original_Fis_Multa_Id) AND ([Valor] = @Original_Valor) AND ([Fecha] = @Original_Fecha) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)))
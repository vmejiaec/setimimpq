CREATE PROCEDURE dbo.Apu_Subtitulo_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Apu_Titulo_Id varchar(17),
	@Original_Int_Empresa_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Apu_Subtitulo] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Apu_Titulo_Id] = @Original_Apu_Titulo_Id) AND ([Int_Empresa_Id] = @Original_Int_Empresa_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))
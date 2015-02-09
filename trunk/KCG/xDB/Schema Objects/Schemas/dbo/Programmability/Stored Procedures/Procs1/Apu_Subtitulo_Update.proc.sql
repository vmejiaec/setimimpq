CREATE PROCEDURE dbo.Apu_Subtitulo_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Apu_Titulo_Id varchar(17),
	@Int_Empresa_Id varchar(17),
	@Estado char(3),
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
UPDATE [Apu_Subtitulo] SET [Id] = @Id, [Codigo] = @Codigo, [Nombre] = @Nombre, [Apu_Titulo_Id] = @Apu_Titulo_Id, [Int_Empresa_Id] = @Int_Empresa_Id, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Apu_Titulo_Id] = @Original_Apu_Titulo_Id) AND ([Int_Empresa_Id] = @Original_Int_Empresa_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Nombre, Apu_Titulo_Id, Int_Empresa_Id, Estado FROM Apu_Subtitulo WHERE (Id = @Id)
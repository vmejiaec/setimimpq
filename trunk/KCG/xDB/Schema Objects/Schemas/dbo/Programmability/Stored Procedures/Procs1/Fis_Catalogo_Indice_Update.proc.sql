CREATE PROCEDURE [dbo].[Fis_Catalogo_Indice_Update]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Estado char(3),
	@Descripcion varchar(2000),
	@Fis_Catalogo_Id varchar(17),
	@Apu_Indice_Id varchar(17),
	@Valor numeric(17, 3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000),
	@Original_Fis_Catalogo_Id varchar(17),
	@Original_Apu_Indice_Id varchar(17),
	@Original_Valor numeric(17, 3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Fis_Catalogo_Indice] SET [Id] = @Id, [Codigo] = @Codigo, [Estado] = @Estado, [Descripcion] = @Descripcion, [Fis_Catalogo_Id] = @Fis_Catalogo_Id, [Apu_Indice_Id] = @Apu_Indice_Id, [Valor] = @Valor WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)) AND ([Fis_Catalogo_Id] = @Original_Fis_Catalogo_Id) AND ([Apu_Indice_Id] = @Original_Apu_Indice_Id) AND ([Valor] = @Original_Valor));
	
SELECT Id, Codigo, Estado, Descripcion, Fis_Catalogo_Id, Apu_Indice_Id, Valor FROM Fis_Catalogo_Indice WHERE (Id = @Id)
CREATE PROCEDURE dbo.Apu_Lugar_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Apu_Provincia_Id varchar(17),
	@Original_Int_Empresa_Id varchar(17),
	@Original_Predeterminada varchar(3),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Apu_Lugar] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Apu_Provincia_Id] = @Original_Apu_Provincia_Id) AND ([Int_Empresa_Id] = @Original_Int_Empresa_Id) AND ([Predeterminada] = @Original_Predeterminada) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))
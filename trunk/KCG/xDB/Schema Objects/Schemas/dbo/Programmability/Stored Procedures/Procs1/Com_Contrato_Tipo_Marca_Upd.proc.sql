CREATE PROCEDURE [dbo].Com_Contrato_Tipo_Marca_Upd
(
	@Nombre varchar(300),
	@Com_Contrato_Tipo_Id int,
	@Origen varchar(300),
	@Descripcion varchar(500),
	@Original_Id int,
	@Original_Nombre varchar(300),
	@Original_Com_Contrato_Tipo_Id int,
	@Original_Origen varchar(300),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(500),
	@Id int
)
AS
	SET NOCOUNT OFF;
UPDATE [Com_Contrato_Tipo_Marca] SET [Nombre] = @Nombre, [Com_Contrato_Tipo_Id] = @Com_Contrato_Tipo_Id, [Origen] = @Origen, [Descripcion] = @Descripcion WHERE (([Id] = @Original_Id) AND ([Nombre] = @Original_Nombre) AND ([Com_Contrato_Tipo_Id] = @Original_Com_Contrato_Tipo_Id) AND ([Origen] = @Original_Origen) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)));
	
SELECT Id, Nombre, Com_Contrato_Tipo_Id, Origen, Descripcion FROM Com_Contrato_Tipo_Marca WHERE (Id = @Id)
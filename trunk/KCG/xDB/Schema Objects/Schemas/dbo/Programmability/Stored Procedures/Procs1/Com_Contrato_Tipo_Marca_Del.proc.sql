CREATE PROCEDURE [dbo].Com_Contrato_Tipo_Marca_Del
(
	@Original_Id int,
	@Original_Nombre varchar(300),
	@Original_Com_Contrato_Tipo_Id int,
	@Original_Origen varchar(300),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(500)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Com_Contrato_Tipo_Marca] WHERE (([Id] = @Original_Id) AND ([Nombre] = @Original_Nombre) AND ([Com_Contrato_Tipo_Id] = @Original_Com_Contrato_Tipo_Id) AND ([Origen] = @Original_Origen) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)))
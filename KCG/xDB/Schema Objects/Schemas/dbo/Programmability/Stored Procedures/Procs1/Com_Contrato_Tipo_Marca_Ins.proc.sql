CREATE PROCEDURE [dbo].Com_Contrato_Tipo_Marca_Ins
(
	@Nombre varchar(300),
	@Com_Contrato_Tipo_Id int,
	@Origen varchar(300),
	@Descripcion varchar(500)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Com_Contrato_Tipo_Marca] ([Nombre], [Com_Contrato_Tipo_Id], [Origen], [Descripcion]) VALUES (@Nombre, @Com_Contrato_Tipo_Id, @Origen, @Descripcion);
	
SELECT Id, Nombre, Com_Contrato_Tipo_Id, Origen, Descripcion FROM Com_Contrato_Tipo_Marca WHERE (Id = SCOPE_IDENTITY())
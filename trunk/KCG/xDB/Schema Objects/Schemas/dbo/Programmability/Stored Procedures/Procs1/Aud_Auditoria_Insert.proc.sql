CREATE PROCEDURE dbo.Aud_Auditoria_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Accion char(3),
	@Fecha datetime,
	@Id_Origen varchar(17),
	@Codigo_Origen varchar(200),
	@Seg_Rol_Id varchar(17),
	@Dic_Objeto_Id varchar(17),
	@Int_Usuario_Id varchar(17),
	@Dic_Contenedor_Id varchar(17),
	@Int_Sucursal_Id varchar(17),
	@Campos varchar(8000),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Aud_Auditoria] ([Id], [Codigo], [Nombre], [Accion], [Fecha], [Id_Origen], [Codigo_Origen], [Seg_Rol_Id], [Dic_Objeto_Id], [Int_Usuario_Id], [Dic_Contenedor_Id], [Int_Sucursal_Id], [Campos], [Estado]) VALUES (@Id, @Codigo, @Nombre, @Accion, @Fecha, @Id_Origen, @Codigo_Origen, @Seg_Rol_Id, @Dic_Objeto_Id, @Int_Usuario_Id, @Dic_Contenedor_Id, @Int_Sucursal_Id, @Campos, @Estado);
	
SELECT Id, Codigo, Nombre, Accion, Fecha, Id_Origen, Codigo_Origen, Seg_Rol_Id, Dic_Objeto_Id, Int_Usuario_Id, Dic_Contenedor_Id, Int_Sucursal_Id, Campos, Estado FROM Aud_Auditoria WHERE (Id = @Id)
CREATE PROCEDURE dbo.Aud_Log_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Fecha datetime,
	@Accion char(3),
	@Dic_Contenedor_Id varchar(17),
	@Int_Sucursal_Id varchar(17),
	@Seg_Rol_Id varchar(17),
	@Int_Usuario_Id varchar(17),
	@Ver_Version_Id varchar(17),
	@Par_Mensaje_Id varchar(17),
	@Procedimiento varchar(500),
	@Parametros varchar(2000),
	@Datos varchar(8000),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Aud_Log] ([Id], [Codigo], [Fecha], [Accion], [Dic_Contenedor_Id], [Int_Sucursal_Id], [Seg_Rol_Id], [Int_Usuario_Id], [Ver_Version_Id], [Par_Mensaje_Id], [Procedimiento], [Parametros], [Datos], [Estado]) VALUES (@Id, @Codigo, @Fecha, @Accion, @Dic_Contenedor_Id, @Int_Sucursal_Id, @Seg_Rol_Id, @Int_Usuario_Id, @Ver_Version_Id, @Par_Mensaje_Id, @Procedimiento, @Parametros, @Datos, @Estado);
	
SELECT Id, Codigo, Fecha, Accion, Dic_Contenedor_Id, Int_Sucursal_Id, Seg_Rol_Id, Int_Usuario_Id, Ver_Version_Id, Par_Mensaje_Id, Procedimiento, Parametros, Datos, Estado FROM Aud_Log WHERE (Id = @Id)
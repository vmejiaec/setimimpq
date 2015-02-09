CREATE PROCEDURE dbo.Aud_Log_Update
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
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Fecha datetime,
	@Original_Accion char(3),
	@Original_Dic_Contenedor_Id varchar(17),
	@Original_Int_Sucursal_Id varchar(17),
	@Original_Seg_Rol_Id varchar(17),
	@Original_Int_Usuario_Id varchar(17),
	@Original_Ver_Version_Id varchar(17),
	@IsNull_Par_Mensaje_Id Int,
	@Original_Par_Mensaje_Id varchar(17),
	@IsNull_Procedimiento Int,
	@Original_Procedimiento varchar(500),
	@IsNull_Parametros Int,
	@Original_Parametros varchar(2000),
	@IsNull_Datos Int,
	@Original_Datos varchar(8000),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Aud_Log] SET [Id] = @Id, [Codigo] = @Codigo, [Fecha] = @Fecha, [Accion] = @Accion, [Dic_Contenedor_Id] = @Dic_Contenedor_Id, [Int_Sucursal_Id] = @Int_Sucursal_Id, [Seg_Rol_Id] = @Seg_Rol_Id, [Int_Usuario_Id] = @Int_Usuario_Id, [Ver_Version_Id] = @Ver_Version_Id, [Par_Mensaje_Id] = @Par_Mensaje_Id, [Procedimiento] = @Procedimiento, [Parametros] = @Parametros, [Datos] = @Datos, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Fecha] = @Original_Fecha) AND ([Accion] = @Original_Accion) AND ([Dic_Contenedor_Id] = @Original_Dic_Contenedor_Id) AND ([Int_Sucursal_Id] = @Original_Int_Sucursal_Id) AND ([Seg_Rol_Id] = @Original_Seg_Rol_Id) AND ([Int_Usuario_Id] = @Original_Int_Usuario_Id) AND ([Ver_Version_Id] = @Original_Ver_Version_Id) AND ((@IsNull_Par_Mensaje_Id = 1 AND [Par_Mensaje_Id] IS NULL) OR ([Par_Mensaje_Id] = @Original_Par_Mensaje_Id)) AND ((@IsNull_Procedimiento = 1 AND [Procedimiento] IS NULL) OR ([Procedimiento] = @Original_Procedimiento)) AND ((@IsNull_Parametros = 1 AND [Parametros] IS NULL) OR ([Parametros] = @Original_Parametros)) AND ((@IsNull_Datos = 1 AND [Datos] IS NULL) OR ([Datos] = @Original_Datos)) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Fecha, Accion, Dic_Contenedor_Id, Int_Sucursal_Id, Seg_Rol_Id, Int_Usuario_Id, Ver_Version_Id, Par_Mensaje_Id, Procedimiento, Parametros, Datos, Estado FROM Aud_Log WHERE (Id = @Id)
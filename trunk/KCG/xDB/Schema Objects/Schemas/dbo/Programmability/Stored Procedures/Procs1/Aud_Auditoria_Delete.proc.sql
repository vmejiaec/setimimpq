CREATE PROCEDURE dbo.Aud_Auditoria_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Accion char(3),
	@Original_Fecha datetime,
	@IsNull_Id_Origen Int,
	@Original_Id_Origen varchar(17),
	@IsNull_Codigo_Origen Int,
	@Original_Codigo_Origen varchar(200),
	@Original_Seg_Rol_Id varchar(17),
	@Original_Dic_Objeto_Id varchar(17),
	@Original_Int_Usuario_Id varchar(17),
	@IsNull_Dic_Contenedor_Id Int,
	@Original_Dic_Contenedor_Id varchar(17),
	@Original_Int_Sucursal_Id varchar(17),
	@Original_Campos varchar(8000),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Aud_Auditoria] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Accion] = @Original_Accion) AND ([Fecha] = @Original_Fecha) AND ((@IsNull_Id_Origen = 1 AND [Id_Origen] IS NULL) OR ([Id_Origen] = @Original_Id_Origen)) AND ((@IsNull_Codigo_Origen = 1 AND [Codigo_Origen] IS NULL) OR ([Codigo_Origen] = @Original_Codigo_Origen)) AND ([Seg_Rol_Id] = @Original_Seg_Rol_Id) AND ([Dic_Objeto_Id] = @Original_Dic_Objeto_Id) AND ([Int_Usuario_Id] = @Original_Int_Usuario_Id) AND ((@IsNull_Dic_Contenedor_Id = 1 AND [Dic_Contenedor_Id] IS NULL) OR ([Dic_Contenedor_Id] = @Original_Dic_Contenedor_Id)) AND ([Int_Sucursal_Id] = @Original_Int_Sucursal_Id) AND ([Campos] = @Original_Campos) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))
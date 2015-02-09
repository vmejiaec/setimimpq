CREATE PROCEDURE dbo.Seg_Menu_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@IsNull_Dic_Pantalla_Id Int,
	@Original_Dic_Pantalla_Id varchar(17),
	@IsNull_Grupo Int,
	@Original_Grupo char(3),
	@Original_Orden int,
	@Original_Int_Usuario_Id varchar(17),
	@Original_Dic_Con_Elemento_Id varchar(17),
	@Original_Seg_Rol_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Seg_Menu] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ((@IsNull_Dic_Pantalla_Id = 1 AND [Dic_Pantalla_Id] IS NULL) OR ([Dic_Pantalla_Id] = @Original_Dic_Pantalla_Id)) AND ((@IsNull_Grupo = 1 AND [Grupo] IS NULL) OR ([Grupo] = @Original_Grupo)) AND ([Orden] = @Original_Orden) AND ([Int_Usuario_Id] = @Original_Int_Usuario_Id) AND ([Dic_Con_Elemento_Id] = @Original_Dic_Con_Elemento_Id) AND ([Seg_Rol_Id] = @Original_Seg_Rol_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))
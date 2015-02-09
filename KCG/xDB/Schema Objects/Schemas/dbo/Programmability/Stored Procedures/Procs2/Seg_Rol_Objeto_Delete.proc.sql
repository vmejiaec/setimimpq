CREATE PROCEDURE dbo.Seg_Rol_Objeto_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Seg_Rol_Id varchar(17),
	@Original_Dic_Con_Objeto_Id varchar(17),
	@Original_Tipo char(3),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Seg_Rol_Objeto] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Seg_Rol_Id] = @Original_Seg_Rol_Id) AND ([Dic_Con_Objeto_Id] = @Original_Dic_Con_Objeto_Id) AND ([Tipo] = @Original_Tipo) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))
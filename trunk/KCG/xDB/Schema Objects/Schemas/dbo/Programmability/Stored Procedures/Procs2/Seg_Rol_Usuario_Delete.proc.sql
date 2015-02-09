CREATE PROCEDURE dbo.Seg_Rol_Usuario_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Seg_Rol_Id varchar(17),
	@Original_Int_Usuario_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Seg_Rol_Usuario] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Seg_Rol_Id] = @Original_Seg_Rol_Id) AND ([Int_Usuario_Id] = @Original_Int_Usuario_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))
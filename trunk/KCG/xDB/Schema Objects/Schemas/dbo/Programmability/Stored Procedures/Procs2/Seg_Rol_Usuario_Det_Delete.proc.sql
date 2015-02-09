CREATE PROCEDURE dbo.Seg_Rol_Usuario_Det_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Seg_Rol_Usuario_Id varchar(17),
	@Original_Int_Sucursal_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Seg_Rol_Usuario_Det] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Seg_Rol_Usuario_Id] = @Original_Seg_Rol_Usuario_Id) AND ([Int_Sucursal_Id] = @Original_Int_Sucursal_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))
CREATE PROCEDURE dbo.Seg_Rol_Usuario_Det_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Seg_Rol_Usuario_Id varchar(17),
	@Int_Sucursal_Id varchar(17),
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Seg_Rol_Usuario_Id varchar(17),
	@Original_Int_Sucursal_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Seg_Rol_Usuario_Det] SET [Id] = @Id, [Codigo] = @Codigo, [Seg_Rol_Usuario_Id] = @Seg_Rol_Usuario_Id, [Int_Sucursal_Id] = @Int_Sucursal_Id, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Seg_Rol_Usuario_Id] = @Original_Seg_Rol_Usuario_Id) AND ([Int_Sucursal_Id] = @Original_Int_Sucursal_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Seg_Rol_Usuario_Id, Int_Sucursal_Id, Estado FROM Seg_Rol_Usuario_Det WHERE (Id = @Id)
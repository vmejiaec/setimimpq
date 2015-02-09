CREATE PROCEDURE dbo.Seg_Rol_Usuario_Det_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Seg_Rol_Usuario_Id varchar(17),
	@Int_Sucursal_Id varchar(17),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Seg_Rol_Usuario_Det] ([Id], [Codigo], [Seg_Rol_Usuario_Id], [Int_Sucursal_Id], [Estado]) VALUES (@Id, @Codigo, @Seg_Rol_Usuario_Id, @Int_Sucursal_Id, @Estado);
	
SELECT Id, Codigo, Seg_Rol_Usuario_Id, Int_Sucursal_Id, Estado FROM Seg_Rol_Usuario_Det WHERE (Id = @Id)
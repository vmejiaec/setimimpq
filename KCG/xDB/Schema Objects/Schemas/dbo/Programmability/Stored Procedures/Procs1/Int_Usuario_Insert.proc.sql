CREATE PROCEDURE [dbo].[Int_Usuario_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Salt varchar(20),
	@Password varchar(50),
	@Usuario_Id_Ref varchar(200),
	@Per_Personal_Id varchar(17),
	@Pred_Seg_Rol_id varchar(17),
	@Pred_Ver_Version_id varchar(17),
	@Pred_Int_Sucursal_id varchar(17),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Int_Usuario] ([Id], [Codigo], [Nombre], [Salt], [Password], [Usuario_Id_Ref], [Per_Personal_Id], [Pred_Seg_Rol_id], [Pred_Ver_Version_id], [Pred_Int_Sucursal_id], [Estado]) VALUES (@Id, @Codigo, @Nombre, @Salt, @Password, @Usuario_Id_Ref, @Per_Personal_Id, @Pred_Seg_Rol_id, @Pred_Ver_Version_id, @Pred_Int_Sucursal_id, @Estado);
	
SELECT Id, Codigo, Nombre, Salt, Password, Usuario_Id_Ref, Per_Personal_Id, Pred_Seg_Rol_id, Pred_Ver_Version_id, Pred_Int_Sucursal_id, Estado FROM Int_Usuario WHERE (Id = @Id)
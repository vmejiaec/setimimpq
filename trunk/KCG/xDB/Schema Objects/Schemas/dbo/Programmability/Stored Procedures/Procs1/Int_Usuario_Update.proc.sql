


CREATE PROCEDURE [dbo].[Int_Usuario_Update]
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
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Salt varchar(20),
	@Original_Password varchar(50),
	@IsNull_Usuario_Id_Ref Int,
	@Original_Usuario_Id_Ref varchar(200),
	@IsNull_Per_Personal_Id Int,
	@Original_Per_Personal_Id varchar(17),
	@IsNull_Pred_Seg_Rol_id Int,
	@Original_Pred_Seg_Rol_id varchar(17),
	@IsNull_Pred_Ver_Version_id Int,
	@Original_Pred_Ver_Version_id varchar(17),
	@IsNull_Pred_Int_Sucursal_id Int,
	@Original_Pred_Int_Sucursal_id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
if (upper(@Password) = 'NULL' or @Password is null)
begin     
UPDATE [Int_Usuario] SET [Id] = @Id, 
	[Codigo] = @Codigo, 
	[Nombre] = @Nombre, 
	--[Salt] = @Salt, 
	--[Password] = @Password, 
	[Usuario_Id_Ref] = @Usuario_Id_Ref, 
	[Per_Personal_Id] = @Per_Personal_Id, 
	[Pred_Seg_Rol_id] = @Pred_Seg_Rol_id, 
	[Pred_Ver_Version_id] = @Pred_Ver_Version_id, 
	[Pred_Int_Sucursal_id] = @Pred_Int_Sucursal_id, 
	[Estado] = @Estado 
		WHERE ( ([Id] = @Original_Id) AND 
			    ([Codigo] = @Original_Codigo) AND 
				([Nombre] = @Original_Nombre) AND 
				--([Salt] = @Original_Salt) AND 
				--([Password] = @Original_Password) AND 
				(	(@IsNull_Usuario_Id_Ref = 1 AND [Usuario_Id_Ref] IS NULL) OR 
					([Usuario_Id_Ref] = @Original_Usuario_Id_Ref)) AND 
				(	(@IsNull_Per_Personal_Id = 1 AND [Per_Personal_Id] IS NULL) OR 
					([Per_Personal_Id] = @Original_Per_Personal_Id)) AND 
				(	(@IsNull_Pred_Seg_Rol_id = 1 AND [Pred_Seg_Rol_id] IS NULL) OR 
				([Pred_Seg_Rol_id] = @Original_Pred_Seg_Rol_id)) AND 
				(	(@IsNull_Pred_Ver_Version_id = 1 AND [Pred_Ver_Version_id] IS NULL) OR 
				([Pred_Ver_Version_id] = @Original_Pred_Ver_Version_id)) AND 
				(	(@IsNull_Pred_Int_Sucursal_id = 1 AND [Pred_Int_Sucursal_id] IS NULL) OR 
				([Pred_Int_Sucursal_id] = @Original_Pred_Int_Sucursal_id)) AND 
				(	(@IsNull_Estado = 1 AND [Estado] IS NULL) OR 
					([Estado] = @Original_Estado)));
end 
else
begin
UPDATE [Int_Usuario] SET [Id] = @Id, 
	[Codigo] = @Codigo, 
	[Nombre] = @Nombre, 
	--[Salt] = @Salt, 
	[Password] = @Password, 
	[Usuario_Id_Ref] = @Usuario_Id_Ref, 
	[Per_Personal_Id] = @Per_Personal_Id, 
	[Pred_Seg_Rol_id] = @Pred_Seg_Rol_id, 
	[Pred_Ver_Version_id] = @Pred_Ver_Version_id, 
	[Pred_Int_Sucursal_id] = @Pred_Int_Sucursal_id, 
	[Estado] = @Estado 
		WHERE ( ([Id] = @Original_Id) AND 
			    ([Codigo] = @Original_Codigo) AND 
				([Nombre] = @Original_Nombre) AND 
				--([Salt] = @Original_Salt) AND 
				--([Password] = @Original_Password) AND 
				(	(@IsNull_Usuario_Id_Ref = 1 AND [Usuario_Id_Ref] IS NULL) OR 
					([Usuario_Id_Ref] = @Original_Usuario_Id_Ref)) AND 
				(	(@IsNull_Per_Personal_Id = 1 AND [Per_Personal_Id] IS NULL) OR 
					([Per_Personal_Id] = @Original_Per_Personal_Id)) AND 
				(	(@IsNull_Pred_Seg_Rol_id = 1 AND [Pred_Seg_Rol_id] IS NULL) OR 
				([Pred_Seg_Rol_id] = @Original_Pred_Seg_Rol_id)) AND 
				(	(@IsNull_Pred_Ver_Version_id = 1 AND [Pred_Ver_Version_id] IS NULL) OR 
				([Pred_Ver_Version_id] = @Original_Pred_Ver_Version_id)) AND 
				(	(@IsNull_Pred_Int_Sucursal_id = 1 AND [Pred_Int_Sucursal_id] IS NULL) OR 
				([Pred_Int_Sucursal_id] = @Original_Pred_Int_Sucursal_id)) AND 
				(	(@IsNull_Estado = 1 AND [Estado] IS NULL) OR 
					([Estado] = @Original_Estado)));
end


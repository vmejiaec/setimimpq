CREATE PROCEDURE dbo.Seg_Rol_Objeto_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Seg_Rol_Id varchar(17),
	@Dic_Con_Objeto_Id varchar(17),
	@Tipo char(3),
	@Estado char(3),
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
UPDATE [Seg_Rol_Objeto] SET [Id] = @Id, [Codigo] = @Codigo, [Seg_Rol_Id] = @Seg_Rol_Id, [Dic_Con_Objeto_Id] = @Dic_Con_Objeto_Id, [Tipo] = @Tipo, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Seg_Rol_Id] = @Original_Seg_Rol_Id) AND ([Dic_Con_Objeto_Id] = @Original_Dic_Con_Objeto_Id) AND ([Tipo] = @Original_Tipo) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Seg_Rol_Id, Dic_Con_Objeto_Id, Tipo, Estado FROM Seg_Rol_Objeto WHERE (Id = @Id)
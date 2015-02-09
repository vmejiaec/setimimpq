CREATE PROCEDURE dbo.Seg_Rol_Menu_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Dic_Pantalla_Id varchar(17),
	@Grupo char(3),
	@Seg_Rol_Id varchar(17),
	@Dic_Con_Elemento_Id varchar(17),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Seg_Rol_Menu] ([Id], [Codigo], [Dic_Pantalla_Id], [Grupo], [Seg_Rol_Id], [Dic_Con_Elemento_Id], [Estado]) VALUES (@Id, @Codigo, @Dic_Pantalla_Id, @Grupo, @Seg_Rol_Id, @Dic_Con_Elemento_Id, @Estado);
	
SELECT Id, Codigo, Dic_Pantalla_Id, Grupo, Seg_Rol_Id, Dic_Con_Elemento_Id, Estado FROM Seg_Rol_Menu WHERE (Id = @Id)
CREATE PROCEDURE dbo.Seg_Menu_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Dic_Pantalla_Id varchar(17),
	@Grupo char(3),
	@Orden int,
	@Int_Usuario_Id varchar(17),
	@Dic_Con_Elemento_Id varchar(17),
	@Seg_Rol_Id varchar(17),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Seg_Menu] ([Id], [Codigo], [Dic_Pantalla_Id], [Grupo], [Orden], [Int_Usuario_Id], [Dic_Con_Elemento_Id], [Seg_Rol_Id], [Estado]) VALUES (@Id, @Codigo, @Dic_Pantalla_Id, @Grupo, @Orden, @Int_Usuario_Id, @Dic_Con_Elemento_Id, @Seg_Rol_Id, @Estado);
	
SELECT Id, Codigo, Dic_Pantalla_Id, Grupo, Orden, Int_Usuario_Id, Dic_Con_Elemento_Id, Seg_Rol_Id, Estado FROM Seg_Menu WHERE (Id = @Id)
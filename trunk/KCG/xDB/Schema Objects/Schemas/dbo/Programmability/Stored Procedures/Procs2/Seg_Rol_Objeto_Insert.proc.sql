CREATE PROCEDURE dbo.Seg_Rol_Objeto_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Seg_Rol_Id varchar(17),
	@Dic_Con_Objeto_Id varchar(17),
	@Tipo char(3),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Seg_Rol_Objeto] ([Id], [Codigo], [Seg_Rol_Id], [Dic_Con_Objeto_Id], [Tipo], [Estado]) VALUES (@Id, @Codigo, @Seg_Rol_Id, @Dic_Con_Objeto_Id, @Tipo, @Estado);
	
SELECT Id, Codigo, Seg_Rol_Id, Dic_Con_Objeto_Id, Tipo, Estado FROM Seg_Rol_Objeto WHERE (Id = @Id)
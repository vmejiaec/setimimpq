CREATE PROCEDURE dbo.Seg_Rol_Elemento_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Seg_Rol_Id varchar(17),
	@Dic_Con_Elemento_Id varchar(17),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Seg_Rol_Elemento] ([Id], [Codigo], [Seg_Rol_Id], [Dic_Con_Elemento_Id], [Estado]) VALUES (@Id, @Codigo, @Seg_Rol_Id, @Dic_Con_Elemento_Id, @Estado);
	
SELECT Id, Codigo, Seg_Rol_Id, Dic_Con_Elemento_Id, Estado FROM Seg_Rol_Elemento WHERE (Id = @Id)
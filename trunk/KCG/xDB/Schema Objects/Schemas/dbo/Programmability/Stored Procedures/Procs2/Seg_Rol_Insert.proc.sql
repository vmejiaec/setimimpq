CREATE PROCEDURE dbo.Seg_Rol_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Descripcion varchar(2000),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Seg_Rol] ([Id], [Codigo], [Nombre], [Descripcion], [Estado]) VALUES (@Id, @Codigo, @Nombre, @Descripcion, @Estado);
	
SELECT Id, Codigo, Nombre, Descripcion, Estado FROM Seg_Rol WHERE (Id = @Id)
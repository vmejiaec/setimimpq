CREATE PROCEDURE dbo.Apr_Documento_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Abreviatura varchar(50),
	@Dic_Campo_id varchar(17),
	@Estado char(3),
	@Descripcion varchar(2000)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apr_Documento] ([Id], [Codigo], [Nombre], [Abreviatura], [Dic_Campo_id], [Estado], [Descripcion]) VALUES (@Id, @Codigo, @Nombre, @Abreviatura, @Dic_Campo_id, @Estado, @Descripcion);
	
SELECT Id, Codigo, Nombre, Abreviatura, Dic_Campo_id, Estado, Descripcion FROM Apr_Documento WHERE (Id = @Id)
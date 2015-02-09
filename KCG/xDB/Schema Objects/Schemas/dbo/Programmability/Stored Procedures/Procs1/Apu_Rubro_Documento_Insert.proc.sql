CREATE PROCEDURE [dbo].[Apu_Rubro_Documento_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Rubro_Id varchar(17),
	@Nombre varchar(500),
	@Ruta varchar(2000),
	@Descripcion varchar(2000),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
SET @Descripcion = Upper(@Descripcion)
INSERT INTO [Apu_Rubro_Documento] ([Id], [Codigo], [Apu_Rubro_Id], [Nombre], [Ruta], [Descripcion], [Estado]) VALUES (@Id, @Codigo, @Apu_Rubro_Id, @Nombre, @Ruta, @Descripcion, @Estado);
	
SELECT Id, Codigo, Apu_Rubro_Id, Nombre, Ruta, Descripcion, Estado FROM Apu_Rubro_Documento WHERE (Id = @Id)

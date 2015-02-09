CREATE PROCEDURE [dbo].[Pla_Cta_Ins]
(
	@Anio char(4),
	@Codigo varchar(200),
	@Nivel char(3),
	@Nombre varchar(500),
	@Descripcion varchar(1000),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Pla_Cta] ([Anio], [Codigo], [Nivel], [Nombre], [Descripcion], [Estado]) VALUES (@Anio, @Codigo, @Nivel, @Nombre, @Descripcion, @Estado);
	
--SELECT Id, Anio, Codigo, Nivel, Nombre, Descripcion, Estado FROM Pla_Cta WHERE (Id = SCOPE_IDENTITY())

SELECT SCOPE_IDENTITY()
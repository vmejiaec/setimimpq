CREATE PROCEDURE [dbo].[Pla_Lote_Tipo_Ins]
(
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Archivo_Tipo char(3),
	@Clase varchar(100),
	@Metodo varchar(100)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Pla_Lote_Tipo] ([Codigo], [Nombre], [Archivo_Tipo], [Clase], [Metodo]) VALUES (@Codigo, @Nombre, @Archivo_Tipo, @Clase, @Metodo);
	
SELECT Id, Codigo, Nombre, Archivo_Tipo, Clase, Metodo FROM Pla_Lote_Tipo WHERE (Id = SCOPE_IDENTITY())

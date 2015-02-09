CREATE PROCEDURE [dbo].[Pla_Lote_Ins]
(
	@Codigo varchar(200),
	@Nombre varchar(500),
	@URL_Archivo_IN varchar(500),
	@Pla_Lote_Tipo_Id int,
	@Resultado varchar(1000),
	@URL_Archivo_OUT varchar(500),
	@Estado char(3),
	@Lote_Fecha smalldatetime
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Pla_Lote] ([Codigo], [Nombre], [URL_Archivo_IN], [Pla_Lote_Tipo_Id], [Resultado], [URL_Archivo_OUT], [Estado], [Lote_Fecha]) VALUES (@Codigo, @Nombre, @URL_Archivo_IN, @Pla_Lote_Tipo_Id, @Resultado, @URL_Archivo_OUT, @Estado, @Lote_Fecha);
	
SELECT Id, Codigo, Nombre, URL_Archivo_IN, Pla_Lote_Tipo_Id, Resultado, URL_Archivo_OUT, Estado, Lote_Fecha FROM Pla_Lote WHERE (Id = SCOPE_IDENTITY())

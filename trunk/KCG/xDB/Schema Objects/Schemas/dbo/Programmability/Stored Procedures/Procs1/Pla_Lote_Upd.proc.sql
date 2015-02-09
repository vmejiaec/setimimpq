CREATE PROCEDURE [dbo].[Pla_Lote_Upd]
(
	@Codigo varchar(200),
	@Nombre varchar(500),
	@URL_Archivo_IN varchar(500),
	@Pla_Lote_Tipo_Id int,
	@Resultado varchar(1000),
	@URL_Archivo_OUT varchar(500),
	@Estado char(3),
	@Lote_Fecha smalldatetime,
	@Original_Id int,
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_URL_Archivo_IN varchar(500),
	@Original_Pla_Lote_Tipo_Id int,
	@Original_Resultado varchar(1000),
	@Original_URL_Archivo_OUT varchar(500),
	@Original_Estado char(3),
	@Original_Lote_Fecha smalldatetime,
	@Id int
)
AS
	SET NOCOUNT OFF;
UPDATE [Pla_Lote] SET [Codigo] = @Codigo, [Nombre] = @Nombre, [URL_Archivo_IN] = @URL_Archivo_IN, [Pla_Lote_Tipo_Id] = @Pla_Lote_Tipo_Id, [Resultado] = @Resultado, [URL_Archivo_OUT] = @URL_Archivo_OUT, [Estado] = @Estado, [Lote_Fecha] = @Lote_Fecha WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([URL_Archivo_IN] = @Original_URL_Archivo_IN) AND ([Pla_Lote_Tipo_Id] = @Original_Pla_Lote_Tipo_Id) AND ([Resultado] = @Original_Resultado) AND ([URL_Archivo_OUT] = @Original_URL_Archivo_OUT) AND ([Estado] = @Original_Estado) AND ([Lote_Fecha] = @Original_Lote_Fecha));
	
SELECT Id, Codigo, Nombre, URL_Archivo_IN, Pla_Lote_Tipo_Id, Resultado, URL_Archivo_OUT, Estado, Lote_Fecha FROM Pla_Lote WHERE (Id = @Id)

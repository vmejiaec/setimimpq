
CREATE PROCEDURE [dbo].[Pla_Lote_Del]
(
	@Original_Id int,
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_URL_Archivo_IN varchar(500),
	@Original_Pla_Lote_Tipo_Id int,
	@Original_Resultado varchar(1000),
	@Original_URL_Archivo_OUT varchar(500),
	@Original_Estado char(3),
	@Original_Lote_Fecha smalldatetime
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Pla_Lote] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([URL_Archivo_IN] = @Original_URL_Archivo_IN) AND ([Pla_Lote_Tipo_Id] = @Original_Pla_Lote_Tipo_Id) AND ([Resultado] = @Original_Resultado) AND ([URL_Archivo_OUT] = @Original_URL_Archivo_OUT) AND ([Estado] = @Original_Estado) AND ([Lote_Fecha] = @Original_Lote_Fecha))

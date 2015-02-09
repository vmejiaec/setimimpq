CREATE PROCEDURE [dbo].Com_Contrato_Legal_Ins
(
	@Com_Contrato_Id int,
	@Com_Contrato_Tipo_Id int,
	@URL_Contrato_Word varchar(250),
	@URL_Contrato_Scan varchar(250),
	@Desc_Alerta_1 varchar(500),
	@Desc_Alerta_2 varchar(500),
	@Desc_Alerta_3 varchar(500),
	@Fecha_Firma_Contrato smalldatetime,
	@Fecha_Contrato smalldatetime
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Com_Contrato_Legal] ([Com_Contrato_Id], [Com_Contrato_Tipo_Id], [URL_Contrato_Word], [URL_Contrato_Scan], [Desc_Alerta_1], [Desc_Alerta_2], [Desc_Alerta_3], [Fecha_Firma_Contrato], [Fecha_Contrato]) VALUES (@Com_Contrato_Id, @Com_Contrato_Tipo_Id, @URL_Contrato_Word, @URL_Contrato_Scan, @Desc_Alerta_1, @Desc_Alerta_2, @Desc_Alerta_3, @Fecha_Firma_Contrato, @Fecha_Contrato);
	
SELECT Id, Com_Contrato_Id, Com_Contrato_Tipo_Id, URL_Contrato_Word, URL_Contrato_Scan, Desc_Alerta_1, Desc_Alerta_2, Desc_Alerta_3, Fecha_Firma_Contrato, Fecha_Contrato FROM Com_Contrato_Legal WHERE (Id = SCOPE_IDENTITY())
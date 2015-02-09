CREATE PROCEDURE dbo.Com_Contrato_Legal_Upd
(
	@Com_Contrato_Id int,
	@Com_Contrato_Tipo_Id int,
	@URL_Contrato_Word varchar(250),
	@URL_Contrato_Scan varchar(250),
	@Desc_Alerta_1 varchar(500),
	@Desc_Alerta_2 varchar(500),
	@Desc_Alerta_3 varchar(500),
	@Fecha_Firma_Contrato smalldatetime,
	@Fecha_Contrato smalldatetime,
	@Original_Id int,
	@Original_Com_Contrato_Id int,
	@Original_Com_Contrato_Tipo_Id int,
	@Original_URL_Contrato_Word varchar(250),
	@Original_URL_Contrato_Scan varchar(250),
	@Original_Desc_Alerta_1 varchar(500),
	@Original_Desc_Alerta_2 varchar(500),
	@Original_Desc_Alerta_3 varchar(500),
	@Original_Fecha_Firma_Contrato smalldatetime,
	@Original_Fecha_Contrato smalldatetime,
	@Id int
)
AS
	SET NOCOUNT OFF;
UPDATE [Com_Contrato_Legal] 
  SET [Com_Contrato_Id] = @Com_Contrato_Id, [Com_Contrato_Tipo_Id] = @Com_Contrato_Tipo_Id, [URL_Contrato_Word] = @URL_Contrato_Word, [URL_Contrato_Scan] = @URL_Contrato_Scan, [Desc_Alerta_1] = @Desc_Alerta_1, [Desc_Alerta_2] = @Desc_Alerta_2, [Desc_Alerta_3] = @Desc_Alerta_3, [Fecha_Firma_Contrato] = @Fecha_Firma_Contrato, [Fecha_Contrato] = @Fecha_Contrato 
  WHERE (
  ([Id] = @Original_Id) 
  --AND ([Com_Contrato_Id] = @Original_Com_Contrato_Id) AND ([Com_Contrato_Tipo_Id] = @Original_Com_Contrato_Tipo_Id) AND ([URL_Contrato_Word] = @Original_URL_Contrato_Word) AND ([URL_Contrato_Scan] = @Original_URL_Contrato_Scan) AND ([Desc_Alerta_1] = @Original_Desc_Alerta_1) AND ([Desc_Alerta_2] = @Original_Desc_Alerta_2) AND ([Desc_Alerta_3] = @Original_Desc_Alerta_3) AND ([Fecha_Firma_Contrato] = @Original_Fecha_Firma_Contrato) AND ([Fecha_Contrato] = @Original_Fecha_Contrato)
  );
	
SELECT Id, Com_Contrato_Id, Com_Contrato_Tipo_Id, URL_Contrato_Word, URL_Contrato_Scan, Desc_Alerta_1, Desc_Alerta_2, Desc_Alerta_3, Fecha_Firma_Contrato, Fecha_Contrato FROM Com_Contrato_Legal WHERE (Id = @Id)

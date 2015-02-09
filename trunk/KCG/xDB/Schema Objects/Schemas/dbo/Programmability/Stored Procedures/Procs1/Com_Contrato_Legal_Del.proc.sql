CREATE PROCEDURE dbo.Com_Contrato_Legal_Del
(
	@Original_Id int,
	@Original_Com_Contrato_Id int,
	@Original_Com_Contrato_Tipo_Id int,
	@Original_URL_Contrato_Word varchar(250),
	@Original_URL_Contrato_Scan varchar(250),
	@Original_Desc_Alerta_1 varchar(500),
	@Original_Desc_Alerta_2 varchar(500),
	@Original_Desc_Alerta_3 varchar(500),
	@Original_Fecha_Firma_Contrato smalldatetime,
	@Original_Fecha_Contrato smalldatetime
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Com_Contrato_Legal] 
  WHERE 
  (
  ([Id] = @Original_Id) 
   --AND ([Com_Contrato_Id] = @Original_Com_Contrato_Id) AND ([Com_Contrato_Tipo_Id] = @Original_Com_Contrato_Tipo_Id) AND ([URL_Contrato_Word] = @Original_URL_Contrato_Word) AND ([URL_Contrato_Scan] = @Original_URL_Contrato_Scan) AND ([Desc_Alerta_1] = @Original_Desc_Alerta_1) AND ([Desc_Alerta_2] = @Original_Desc_Alerta_2) AND ([Desc_Alerta_3] = @Original_Desc_Alerta_3) AND ([Fecha_Firma_Contrato] = @Original_Fecha_Firma_Contrato) AND ([Fecha_Contrato] = @Original_Fecha_Contrato)
  )

CREATE PROCEDURE [dbo].Com_Planilla_Deposito_Del
(
	@Original_Id int,
	@Original_Fis_Planilla_Id varchar(17),
	@Original_Codigo_Deposito varchar(200),
	@Original_Fecha_Deposito smalldatetime,
	@Original_Comprobante_Ctbl varchar(200),
	@Original_Valor numeric(17, 4),
	@Original_Valor_Interes numeric(17, 4),
	@Original_Descripcion varchar(300)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Com_Planilla_Deposito] WHERE (([Id] = @Original_Id) AND ([Fis_Planilla_Id] = @Original_Fis_Planilla_Id) AND ([Codigo_Deposito] = @Original_Codigo_Deposito) AND ([Fecha_Deposito] = @Original_Fecha_Deposito) AND ([Comprobante_Ctbl] = @Original_Comprobante_Ctbl) AND ([Valor] = @Original_Valor) AND ([Valor_Interes] = @Original_Valor_Interes) AND ([Descripcion] = @Original_Descripcion))
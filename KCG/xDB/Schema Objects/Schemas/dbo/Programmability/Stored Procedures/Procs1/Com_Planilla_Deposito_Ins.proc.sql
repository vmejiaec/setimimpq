CREATE PROCEDURE [dbo].Com_Planilla_Deposito_Ins
(
	@Fis_Planilla_Id varchar(17),
	@Codigo_Deposito varchar(200),
	@Fecha_Deposito smalldatetime,
	@Comprobante_Ctbl varchar(200),
	@Valor numeric(17, 4),
	@Valor_Interes numeric(17, 4),
	@Descripcion varchar(300)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Com_Planilla_Deposito] ([Fis_Planilla_Id], [Codigo_Deposito], [Fecha_Deposito], [Comprobante_Ctbl], [Valor], [Valor_Interes], [Descripcion]) VALUES (@Fis_Planilla_Id, @Codigo_Deposito, @Fecha_Deposito, @Comprobante_Ctbl, @Valor, @Valor_Interes, @Descripcion);
	
SELECT Id, Fis_Planilla_Id, Codigo_Deposito, Fecha_Deposito, Comprobante_Ctbl, Valor, Valor_Interes, Descripcion FROM Com_Planilla_Deposito WHERE (Id = SCOPE_IDENTITY())
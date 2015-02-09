CREATE PROCEDURE [dbo].Com_Planilla_Deposito_Upd
(
	@Fis_Planilla_Id varchar(17),
	@Codigo_Deposito varchar(200),
	@Fecha_Deposito smalldatetime,
	@Comprobante_Ctbl varchar(200),
	@Valor numeric(17, 4),
	@Valor_Interes numeric(17, 4),
	@Descripcion varchar(300),
	@Original_Id int,
	@Original_Fis_Planilla_Id varchar(17),
	@Original_Codigo_Deposito varchar(200),
	@Original_Fecha_Deposito smalldatetime,
	@Original_Comprobante_Ctbl varchar(200),
	@Original_Valor numeric(17, 4),
	@Original_Valor_Interes numeric(17, 4),
	@Original_Descripcion varchar(300),
	@Id int
)
AS
	SET NOCOUNT OFF;
UPDATE [Com_Planilla_Deposito] SET [Fis_Planilla_Id] = @Fis_Planilla_Id, [Codigo_Deposito] = @Codigo_Deposito, [Fecha_Deposito] = @Fecha_Deposito, [Comprobante_Ctbl] = @Comprobante_Ctbl, [Valor] = @Valor, [Valor_Interes] = @Valor_Interes, [Descripcion] = @Descripcion WHERE (([Id] = @Original_Id) AND ([Fis_Planilla_Id] = @Original_Fis_Planilla_Id) AND ([Codigo_Deposito] = @Original_Codigo_Deposito) AND ([Fecha_Deposito] = @Original_Fecha_Deposito) AND ([Comprobante_Ctbl] = @Original_Comprobante_Ctbl) AND ([Valor] = @Original_Valor) AND ([Valor_Interes] = @Original_Valor_Interes) AND ([Descripcion] = @Original_Descripcion));
	
SELECT Id, Fis_Planilla_Id, Codigo_Deposito, Fecha_Deposito, Comprobante_Ctbl, Valor, Valor_Interes, Descripcion FROM Com_Planilla_Deposito WHERE (Id = @Id)
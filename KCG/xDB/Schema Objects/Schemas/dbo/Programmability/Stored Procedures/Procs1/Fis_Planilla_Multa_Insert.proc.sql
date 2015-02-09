CREATE PROCEDURE dbo.Fis_Planilla_Multa_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Fis_Planilla_Id varchar(17),
	@Fis_Multa_Id varchar(17),
	@Valor numeric(17, 2),
	@Fecha smalldatetime,
	@Estado char(3),
	@Descripcion varchar(2000)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Fis_Planilla_Multa] ([Id], [Codigo], [Fis_Planilla_Id], [Fis_Multa_Id], [Valor], [Fecha], [Estado], [Descripcion]) VALUES (@Id, @Codigo, @Fis_Planilla_Id, @Fis_Multa_Id, @Valor, @Fecha, @Estado, @Descripcion);
	
SELECT Id, Codigo, Fis_Planilla_Id, Fis_Multa_Id, Valor, Fecha, Estado, Descripcion FROM Fis_Planilla_Multa WHERE (Id = @Id)
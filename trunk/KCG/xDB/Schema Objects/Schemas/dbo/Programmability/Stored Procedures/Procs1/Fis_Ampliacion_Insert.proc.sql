CREATE PROCEDURE dbo.Fis_Ampliacion_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Estado char(3),
	@Descripcion varchar(2000),
	@Apu_Presupuesto_Id varchar(17),
	@Nombre varchar(500),
	@Fecha_Autorizacion smalldatetime,
	@Plazo_Dias int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Fis_Ampliacion] ([Id], [Codigo], [Estado], [Descripcion], [Apu_Presupuesto_Id], [Nombre], [Fecha_Autorizacion], [Plazo_Dias]) VALUES (@Id, @Codigo, @Estado, @Descripcion, @Apu_Presupuesto_Id, @Nombre, @Fecha_Autorizacion, @Plazo_Dias);
	
SELECT Id, Codigo, Estado, Descripcion, Apu_Presupuesto_Id, Nombre, Fecha_Autorizacion, Plazo_Dias FROM Fis_Ampliacion WHERE (Id = @Id)
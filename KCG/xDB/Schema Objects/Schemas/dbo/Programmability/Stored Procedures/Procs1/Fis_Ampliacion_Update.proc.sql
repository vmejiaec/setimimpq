CREATE PROCEDURE dbo.Fis_Ampliacion_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Estado char(3),
	@Descripcion varchar(2000),
	@Apu_Presupuesto_Id varchar(17),
	@Nombre varchar(500),
	@Fecha_Autorizacion smalldatetime,
	@Plazo_Dias int,
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000),
	@Original_Apu_Presupuesto_Id varchar(17),
	@Original_Nombre varchar(500),
	@Original_Fecha_Autorizacion smalldatetime,
	@Original_Plazo_Dias int
)
AS
	SET NOCOUNT OFF;
UPDATE [Fis_Ampliacion] SET [Id] = @Id, [Codigo] = @Codigo, [Estado] = @Estado, [Descripcion] = @Descripcion, [Apu_Presupuesto_Id] = @Apu_Presupuesto_Id, [Nombre] = @Nombre, [Fecha_Autorizacion] = @Fecha_Autorizacion, [Plazo_Dias] = @Plazo_Dias WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)) AND ([Apu_Presupuesto_Id] = @Original_Apu_Presupuesto_Id) AND ([Nombre] = @Original_Nombre) AND ([Fecha_Autorizacion] = @Original_Fecha_Autorizacion) AND ([Plazo_Dias] = @Original_Plazo_Dias));
	
SELECT Id, Codigo, Estado, Descripcion, Apu_Presupuesto_Id, Nombre, Fecha_Autorizacion, Plazo_Dias FROM Fis_Ampliacion WHERE (Id = @Id)
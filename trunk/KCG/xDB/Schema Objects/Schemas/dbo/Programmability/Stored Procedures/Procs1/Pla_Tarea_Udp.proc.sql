CREATE PROCEDURE [dbo].Pla_Tarea_Udp
(
	@Codigo varchar(200),
	@Pla_Cta_Id int,
	@Nombre varchar(500),
	@Fecha_Ini smalldatetime,
	@Fecha_Fin smalldatetime,
	@Estado char(3),
	@Original_Id int,
	@Original_Codigo varchar(200),
	@Original_Pla_Cta_Id int,
	@Original_Nombre varchar(500),
	@Original_Fecha_Ini smalldatetime,
	@Original_Fecha_Fin smalldatetime,
	@Original_Estado char(3),
	@Id int
)
AS
	SET NOCOUNT OFF;
UPDATE [Pla_Tarea] SET [Codigo] = @Codigo, [Pla_Cta_Id] = @Pla_Cta_Id, [Nombre] = @Nombre, [Fecha_Ini] = @Fecha_Ini, [Fecha_Fin] = @Fecha_Fin, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Pla_Cta_Id] = @Original_Pla_Cta_Id) AND ([Nombre] = @Original_Nombre) AND ([Fecha_Ini] = @Original_Fecha_Ini) AND ([Fecha_Fin] = @Original_Fecha_Fin) AND ([Estado] = @Original_Estado));
	
SELECT Id, Codigo, Pla_Cta_Id, Nombre, Fecha_Ini, Fecha_Fin, Estado FROM Pla_Tarea WHERE (Id = @Id)
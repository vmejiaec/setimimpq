CREATE PROCEDURE [dbo].[Apu_Rubro_Equipo_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Rubro_Id varchar(17),
	@Apu_Equipo_Id varchar(17),
	@Cantidad numeric(17, 4),
	@Creacion_Per_Personal_Id varchar(17),
	@Fecha_Creacion smalldatetime,
	@Update_Per_Personal_Id varchar(17),
	@Fecha_Update smalldatetime,
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Rubro_Equipo] ([Id], [Codigo], [Apu_Rubro_Id], [Apu_Equipo_Id], [Cantidad], [Creacion_Per_Personal_Id], [Fecha_Creacion], [Update_Per_Personal_Id], [Fecha_Update], [Estado]) 
VALUES (@Id, @Codigo, @Apu_Rubro_Id, @Apu_Equipo_Id, @Cantidad, @Creacion_Per_Personal_Id, getDate(), @Update_Per_Personal_Id, getDate(), @Estado);
	
SELECT Id, Codigo, Apu_Rubro_Id, Apu_Equipo_Id, Cantidad, Creacion_Per_Personal_Id, Fecha_Creacion, Update_Per_Personal_Id, Fecha_Update, Estado FROM Apu_Rubro_Equipo WHERE (Id = @Id)



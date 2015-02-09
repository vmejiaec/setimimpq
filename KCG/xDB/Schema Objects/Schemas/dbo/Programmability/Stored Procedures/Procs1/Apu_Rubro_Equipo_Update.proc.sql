CREATE PROCEDURE [dbo].[Apu_Rubro_Equipo_Update]
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
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Apu_Rubro_Id varchar(17),
	@Original_Apu_Equipo_Id varchar(17),
	@Original_Cantidad numeric(17, 4),
	@Original_Creacion_Per_Personal_Id varchar(17),
	@Original_Fecha_Creacion smalldatetime,
	@Original_Update_Per_Personal_Id varchar(17),
	@Original_Fecha_Update smalldatetime,
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Apu_Rubro_Equipo] 
SET [Id] = @Id, [Codigo] = @Codigo, [Apu_Rubro_Id] = @Apu_Rubro_Id, [Apu_Equipo_Id] = @Apu_Equipo_Id, [Cantidad] = @Cantidad, [Creacion_Per_Personal_Id] = @Creacion_Per_Personal_Id, [Fecha_Creacion] = @Fecha_Creacion, [Update_Per_Personal_Id] = @Update_Per_Personal_Id, [Fecha_Update] = getDate(), [Estado] = @Estado 
WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Apu_Rubro_Id] = @Original_Apu_Rubro_Id) AND ([Apu_Equipo_Id] = @Original_Apu_Equipo_Id) AND ([Cantidad] = @Original_Cantidad) AND ([Creacion_Per_Personal_Id] = @Original_Creacion_Per_Personal_Id) AND ([Fecha_Creacion] = @Original_Fecha_Creacion) AND ([Update_Per_Personal_Id] = @Original_Update_Per_Personal_Id) AND ([Fecha_Update] = @Original_Fecha_Update) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Apu_Rubro_Id, Apu_Equipo_Id, Cantidad, Creacion_Per_Personal_Id, Fecha_Creacion, Update_Per_Personal_Id, Fecha_Update, Estado FROM Apu_Rubro_Equipo WHERE (Id = @Id)


CREATE PROCEDURE [dbo].[Apu_Proyecto_Rubro_Equipo_Update]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Proyecto_Rubro_Id varchar(17),
	@Apu_Equipo_Id varchar(17),
	@Cantidad numeric(17, 4),
	@Fecha_Creacion smalldatetime,
	@Creacion_Per_Personal_Id varchar(17),
	@Fecha_Update smalldatetime,
	@Update_Per_Personal_Id varchar(17),
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Apu_Proyecto_Rubro_Id varchar(17),
	@Original_Apu_Equipo_Id varchar(17),
	@Original_Cantidad numeric(17, 4),
	@Original_Fecha_Creacion smalldatetime,
	@Original_Creacion_Per_Personal_Id varchar(17),
	@Original_Fecha_Update smalldatetime,
	@Original_Update_Per_Personal_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Apu_Proyecto_Rubro_Equipo] 
SET [Id] = @Id, [Codigo] = @Codigo, [Apu_Proyecto_Rubro_Id] = @Apu_Proyecto_Rubro_Id, [Apu_Equipo_Id] = @Apu_Equipo_Id, [Cantidad] = @Cantidad, [Fecha_Creacion] = @Fecha_Creacion, [Creacion_Per_Personal_Id] = @Creacion_Per_Personal_Id, [Fecha_Update] = getDate(), [Update_Per_Personal_Id] = @Update_Per_Personal_Id, [Estado] = @Estado 
WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Apu_Proyecto_Rubro_Id] = @Original_Apu_Proyecto_Rubro_Id) AND ([Apu_Equipo_Id] = @Original_Apu_Equipo_Id) AND ([Cantidad] = @Original_Cantidad) AND ([Fecha_Creacion] = @Original_Fecha_Creacion) AND ([Creacion_Per_Personal_Id] = @Original_Creacion_Per_Personal_Id) AND ([Fecha_Update] = @Original_Fecha_Update) AND ([Update_Per_Personal_Id] = @Original_Update_Per_Personal_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Apu_Proyecto_Rubro_Id, Apu_Equipo_Id, Cantidad, Fecha_Creacion, Creacion_Per_Personal_Id, Fecha_Update, Update_Per_Personal_Id, Estado FROM Apu_Proyecto_Rubro_Equipo WHERE (Id = @Id)


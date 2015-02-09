CREATE PROCEDURE [dbo].[Apu_Proyecto_Rubro_Mano_Obra_Update]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Proyecto_Rubro_Id varchar(17),
	@Apu_Mano_Obra_Id varchar(17),
	@Cantidad numeric(17, 4),
	@Estado char(3),
	@Fecha_Creacion smalldatetime,
	@Creacion_Per_Personal_Id varchar(17),
	@Fecha_Update smalldatetime,
	@Update_Per_Personal_Id varchar(17),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Apu_Proyecto_Rubro_Id varchar(17),
	@Original_Apu_Mano_Obra_Id varchar(17),
	@Original_Cantidad numeric(17, 4),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@Original_Fecha_Creacion smalldatetime,
	@Original_Creacion_Per_Personal_Id varchar(17),
	@Original_Fecha_Update smalldatetime,
	@Original_Update_Per_Personal_Id varchar(17)
)
AS
	SET NOCOUNT OFF;

UPDATE [Apu_Proyecto_Rubro_Mano_Obra] 
SET [Id] = @Id, [Codigo] = @Codigo, [Apu_Proyecto_Rubro_Id] = @Apu_Proyecto_Rubro_Id, [Apu_Mano_Obra_Id] = @Apu_Mano_Obra_Id, [Cantidad] = @Cantidad, [Estado] = @Estado, [Fecha_Creacion] = @Fecha_Creacion, [Creacion_Per_Personal_Id] = @Creacion_Per_Personal_Id, [Fecha_Update] = GetDate(), [Update_Per_Personal_Id] = @Update_Per_Personal_Id 
WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Apu_Proyecto_Rubro_Id] = @Original_Apu_Proyecto_Rubro_Id) AND ([Apu_Mano_Obra_Id] = @Original_Apu_Mano_Obra_Id) AND ([Cantidad] = @Original_Cantidad) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ([Fecha_Creacion] = @Original_Fecha_Creacion) AND ([Creacion_Per_Personal_Id] = @Original_Creacion_Per_Personal_Id) AND ([Fecha_Update] = @Original_Fecha_Update) AND ([Update_Per_Personal_Id] = @Original_Update_Per_Personal_Id));
	
SELECT Id, Codigo, Apu_Proyecto_Rubro_Id, Apu_Mano_Obra_Id, Cantidad, Estado, Fecha_Creacion, Creacion_Per_Personal_Id, Fecha_Update, Update_Per_Personal_Id FROM Apu_Proyecto_Rubro_Mano_Obra WHERE (Id = @Id)


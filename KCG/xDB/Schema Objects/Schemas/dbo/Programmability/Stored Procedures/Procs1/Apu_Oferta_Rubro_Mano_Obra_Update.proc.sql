CREATE PROCEDURE [dbo].[Apu_Oferta_Rubro_Mano_Obra_Update]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Fecha_Creacion smalldatetime,
	@Creacion_Per_Personal_Id varchar(17),
	@Fecha_Update smalldatetime,
	@Update_Per_Personal_Id varchar(17),
	@Costo numeric(17, 4),
	@Apu_Oferta_Rubro_Id varchar(17),
	@Apu_Mano_Obra_Id varchar(17),
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Fecha_Creacion smalldatetime,
	@Original_Creacion_Per_Personal_Id varchar(17),
	@Original_Fecha_Update smalldatetime,
	@Original_Update_Per_Personal_Id varchar(17),
	@Original_Costo numeric(17, 4),
	@Original_Apu_Oferta_Rubro_Id varchar(17),
	@Original_Apu_Mano_Obra_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Apu_Oferta_Rubro_Mano_Obra] SET [Id] = @Id, [Codigo] = @Codigo, [Fecha_Creacion] = @Fecha_Creacion, [Creacion_Per_Personal_Id] = @Creacion_Per_Personal_Id, [Fecha_Update] = @Fecha_Update, [Update_Per_Personal_Id] = @Update_Per_Personal_Id, [Costo] = @Costo, [Apu_Oferta_Rubro_Id] = @Apu_Oferta_Rubro_Id, [Apu_Mano_Obra_Id] = @Apu_Mano_Obra_Id, [Estado] = @Estado 
WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Fecha_Creacion] = @Original_Fecha_Creacion) AND ([Creacion_Per_Personal_Id] = @Original_Creacion_Per_Personal_Id) AND ([Fecha_Update] = @Original_Fecha_Update) AND ([Update_Per_Personal_Id] = @Original_Update_Per_Personal_Id) AND ([Costo] = @Original_Costo) AND ([Apu_Oferta_Rubro_Id] = @Original_Apu_Oferta_Rubro_Id) AND ([Apu_Mano_Obra_Id] = @Original_Apu_Mano_Obra_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) );
	
SELECT Id, Codigo, Fecha_Creacion, Creacion_Per_Personal_Id, Fecha_Update, Update_Per_Personal_Id, Costo, Apu_Oferta_Rubro_Id, Apu_Mano_Obra_Id, Estado FROM Apu_Oferta_Rubro_Mano_Obra WHERE (Id = @Id)
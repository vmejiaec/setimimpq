CREATE PROCEDURE [dbo].[Apu_Rubro_Mano_Obra_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Rubro_Id varchar(17),
	@Apu_Mano_Obra_Id varchar(17),
	@Cantidad numeric(17, 4),
	@Fecha_Update smalldatetime,
	@Update_Per_Personal_Id varchar(17),
	@Fecha_Creacion smalldatetime,
	@Creacion_Per_Personal_Id varchar(17),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Rubro_Mano_Obra] ([Id], [Codigo], [Apu_Rubro_Id], [Apu_Mano_Obra_Id], [Cantidad], [Fecha_Update], [Update_Per_Personal_Id], [Fecha_Creacion], [Creacion_Per_Personal_Id], [Estado])
VALUES (@Id, @Codigo, @Apu_Rubro_Id, @Apu_Mano_Obra_Id, @Cantidad, getDate(), @Update_Per_Personal_Id, getDate(), @Creacion_Per_Personal_Id, @Estado);
	
SELECT Id, Codigo, Apu_Rubro_Id, Apu_Mano_Obra_Id, Cantidad, Fecha_Update, Update_Per_Personal_Id, Fecha_Creacion, Creacion_Per_Personal_Id, Estado FROM Apu_Rubro_Mano_Obra WHERE (Id = @Id)




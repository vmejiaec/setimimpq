CREATE PROCEDURE [dbo].[Apu_Rubro_Material_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Rubro_Id varchar(17),
	@Apu_Material_Id varchar(17),
	@Cantidad numeric(17, 4),
	@Fecha_Update smalldatetime,
	@Update_Per_Personal_Id varchar(17),
	@Fecha_Creacion smalldatetime,
	@Creacion_Per_Personal_Id varchar(17),
	@UpdateTransporte_Per_Personal_Id varchar(17),
	@Fecha_UpdateTransporte smalldatetime,
	@Estado char(3)
)

AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Rubro_Material] ([Id], [Codigo], [Apu_Rubro_Id], [Apu_Material_Id], [Cantidad], [Fecha_Update], [Update_Per_Personal_Id], [Fecha_Creacion], [Creacion_Per_Personal_Id], [UpdateTransporte_Per_Personal_Id], [Fecha_UpdateTransporte], [Estado]) 
VALUES (@Id, @Codigo, @Apu_Rubro_Id, @Apu_Material_Id, @Cantidad, getDate(), @Update_Per_Personal_Id, getDate(), @Creacion_Per_Personal_Id, @UpdateTransporte_Per_Personal_Id, getDate(), @Estado);
	
SELECT Id, Codigo, Apu_Rubro_Id, Apu_Material_Id, Cantidad, Fecha_Update, Update_Per_Personal_Id, Fecha_Creacion, Creacion_Per_Personal_Id, UpdateTransporte_Per_Personal_Id, Fecha_UpdateTransporte, Estado FROM Apu_Rubro_Material WHERE (Id = @Id)




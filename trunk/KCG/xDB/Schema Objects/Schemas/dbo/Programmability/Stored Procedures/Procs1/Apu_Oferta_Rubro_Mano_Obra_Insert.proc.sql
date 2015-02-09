CREATE PROCEDURE [dbo].[Apu_Oferta_Rubro_Mano_Obra_Insert]
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
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Oferta_Rubro_Mano_Obra] ([Id], [Codigo], [Fecha_Creacion], [Creacion_Per_Personal_Id], [Fecha_Update], [Update_Per_Personal_Id], [Costo], [Apu_Oferta_Rubro_Id], [Apu_Mano_Obra_Id], [Estado]) VALUES (@Id, @Codigo, getDate(), @Creacion_Per_Personal_Id, getDate(), @Update_Per_Personal_Id, @Costo, @Apu_Oferta_Rubro_Id, @Apu_Mano_Obra_Id, @Estado);
	
SELECT Id, Codigo, Fecha_Creacion, Creacion_Per_Personal_Id, Fecha_Update, Update_Per_Personal_Id, Costo, Apu_Oferta_Rubro_Id, Apu_Mano_Obra_Id, Estado FROM Apu_Oferta_Rubro_Mano_Obra WHERE (Id = @Id)

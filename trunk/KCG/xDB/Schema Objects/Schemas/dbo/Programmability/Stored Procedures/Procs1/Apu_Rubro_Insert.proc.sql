CREATE PROCEDURE [dbo].[Apu_Rubro_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Unidad varchar(200),
	@Int_Sucursal_Id varchar(17),
	@Apu_Subtitulo_Id varchar(17),
	@Int_Moneda_Id varchar(17),
	@Rendimiento_Mano_Obra numeric(17, 6),
	@Rendimiento_Equipo numeric(17, 6),
	@Especial varchar(3),
	@Disponible varchar(3),
	@Descripcion varchar(4000),
	@Creacion_Per_Personal_Id varchar(17),
	@Fecha_Creacion smalldatetime,
	@Update_Per_Personal_Id varchar(17),
	@Fecha_Update smalldatetime,
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;

SET @Descripcion = UPPER(@Descripcion)
INSERT INTO [Apu_Rubro] ([Id], [Codigo], [Nombre], [Unidad], [Int_Sucursal_Id], [Apu_Subtitulo_Id], [Int_Moneda_Id], [Rendimiento_Mano_Obra], [Rendimiento_Equipo], [Especial], [Disponible], [Descripcion], [Creacion_Per_Personal_Id], [Fecha_Creacion], [Update_Per_Personal_Id], [Fecha_Update], [Estado]) 
VALUES (@Id, @Codigo, @Nombre, @Unidad, @Int_Sucursal_Id, @Apu_Subtitulo_Id, @Int_Moneda_Id, @Rendimiento_Mano_Obra, @Rendimiento_Equipo, @Especial, @Disponible, @Descripcion, @Creacion_Per_Personal_Id, getDate(), @Update_Per_Personal_Id, getDate(), @Estado);
	
SELECT Id, Codigo, Nombre, Unidad, Int_Sucursal_Id, Apu_Subtitulo_Id, Int_Moneda_Id, Rendimiento_Mano_Obra, Rendimiento_Equipo, Especial, Disponible, Descripcion, Creacion_Per_Personal_Id, Fecha_Creacion, Update_Per_Personal_Id, Fecha_Update, Estado FROM Apu_Rubro WHERE (Id = @Id)





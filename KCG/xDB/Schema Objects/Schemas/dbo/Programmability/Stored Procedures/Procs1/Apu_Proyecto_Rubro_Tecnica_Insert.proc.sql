CREATE PROCEDURE [dbo].[Apu_Proyecto_Rubro_Tecnica_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Proyecto_Rubro_Id varchar(17),
	@Imagen varchar(500),
	@Origen_Imagen varchar(4000),
	@Definicion varchar(4000),
	@Especificacion varchar(4000),
	@Medicion varchar(4000),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
SET @Imagen= UPPER(@Imagen)
SET @Origen_Imagen = UPPER(@Origen_Imagen)
SET @Definicion = UPPER(@Definicion)
SET @Especificacion = UPPER(@Especificacion)
SET @Medicion = UPPER(@Medicion)
INSERT INTO [Apu_Proyecto_Rubro_Tecnica] ([Id], [Codigo], [Apu_Proyecto_Rubro_Id], [Imagen], [Origen_Imagen], [Definicion], [Especificacion], [Medicion], [Estado]) VALUES (@Id, @Codigo, @Apu_Proyecto_Rubro_Id, @Imagen, @Origen_Imagen, @Definicion, @Especificacion, @Medicion, @Estado);
	
SELECT Id, Codigo, Apu_Proyecto_Rubro_Id, Imagen, Origen_Imagen, Definicion, Especificacion, Medicion, Estado FROM Apu_Proyecto_Rubro_Tecnica WHERE (Id = @Id)

CREATE PROCEDURE [dbo].[Apu_Rubro_Tecnica_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Rubro_Id varchar(17),
	@Imagen varchar(2000),
	@Origen_Imagen varchar(4000),
	@Definicion varchar(4000),
	@Especificacion varchar(4000),
	@Medicion varchar(4000),
	@Estado char(3)
)
AS

SET NOCOUNT OFF;
set @Imagen = upper (@Imagen)
set	@Origen_Imagen = upper (@Origen_Imagen)
set	@Definicion = upper(@Definicion)
set	@Especificacion = upper(@Especificacion)
set	@Medicion = upper(@Medicion)

INSERT INTO [Apu_Rubro_Tecnica] ([Id], [Codigo], [Apu_Rubro_Id], [Imagen], [Origen_Imagen], [Definicion], [Especificacion], [Medicion], [Estado]) VALUES (@Id, @Codigo, @Apu_Rubro_Id, @Imagen, @Origen_Imagen, @Definicion, @Especificacion, @Medicion, @Estado);
	
SELECT Id, Codigo, Apu_Rubro_Id, Imagen, Origen_Imagen, Definicion, Especificacion, Medicion, Estado FROM Apu_Rubro_Tecnica WHERE (Id = @Id)



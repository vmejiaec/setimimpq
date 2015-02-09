CREATE PROCEDURE dbo.Apu_Rubro_Tecnica_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Rubro_Id varchar(17),
	@Imagen varchar(2000),
	@Origen_Imagen varchar(4000),
	@Definicion varchar(4000),
	@Especificacion varchar(4000),
	@Medicion varchar(4000),
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Apu_Rubro_Id varchar(17),
	@IsNull_Imagen Int,
	@Original_Imagen varchar(2000),
	@IsNull_Origen_Imagen Int,
	@Original_Origen_Imagen varchar(4000),
	@IsNull_Definicion Int,
	@Original_Definicion varchar(4000),
	@IsNull_Especificacion Int,
	@Original_Especificacion varchar(4000),
	@IsNull_Medicion Int,
	@Original_Medicion varchar(4000),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;


set @Imagen = upper (@Imagen)
set	@Origen_Imagen = upper (@Origen_Imagen)
set	@Definicion = upper(@Definicion)
set	@Especificacion = upper(@Especificacion)
set	@Medicion = upper(@Medicion)

UPDATE [Apu_Rubro_Tecnica] 
  SET [Id] = @Id, [Codigo] = @Codigo, [Apu_Rubro_Id] = @Apu_Rubro_Id, [Imagen] = @Imagen, [Origen_Imagen] = @Origen_Imagen, [Definicion] = @Definicion, [Especificacion] = @Especificacion, [Medicion] = @Medicion, [Estado] = @Estado 
  WHERE (
  ([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Apu_Rubro_Id] = @Original_Apu_Rubro_Id) 
  --AND ((@IsNull_Imagen = 1 AND [Imagen] IS NULL) OR ([Imagen] = @Original_Imagen)) 
  --AND ((@IsNull_Origen_Imagen = 1 AND [Origen_Imagen] IS NULL) OR ([Origen_Imagen] = @Original_Origen_Imagen)) 
  --AND ((@IsNull_Definicion = 1 AND [Definicion] IS NULL) OR ([Definicion] = @Original_Definicion)) 
  --AND ((@IsNull_Especificacion = 1 AND [Especificacion] IS NULL) OR ([Especificacion] = @Original_Especificacion)) 
  --AND ((@IsNull_Medicion = 1 AND [Medicion] IS NULL) OR ([Medicion] = @Original_Medicion)) 
  AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado))
  );
	
SELECT Id, Codigo, Apu_Rubro_Id, Imagen, Origen_Imagen, Definicion, Especificacion, Medicion, Estado FROM Apu_Rubro_Tecnica WHERE (Id = @Id)


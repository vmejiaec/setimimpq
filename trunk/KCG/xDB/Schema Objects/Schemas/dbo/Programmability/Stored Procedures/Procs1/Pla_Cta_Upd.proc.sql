CREATE PROCEDURE [dbo].[Pla_Cta_Upd]
(
	@Anio char(4),
	@Codigo varchar(200),
	@Nivel char(3),
	@Nombre varchar(500),
	@Descripcion varchar(1000),
	@Estado char(3),
	@Original_Id int,
	@Original_Anio char(4),
	@Original_Codigo varchar(200),
	@Original_Nivel char(3),
	@Original_Nombre varchar(500),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(1000),
	@Original_Estado char(3),
	@Id int
)
AS
	SET NOCOUNT OFF;
UPDATE [Pla_Cta] 
SET [Anio] = @Anio, 
[Codigo] = @Codigo, 
[Nivel] = @Nivel, 
[Nombre] = @Nombre, 
[Descripcion] = @Descripcion, 
[Estado] = @Estado 
WHERE (([Id] = @Original_Id) 
AND ([Anio] = @Original_Anio) 
AND ([Codigo] = @Original_Codigo) 
AND ([Nivel] = @Original_Nivel) 
AND ([Nombre] = @Original_Nombre) 
AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)) 
AND ([Estado] = @Original_Estado));
	
SELECT Id, Anio, Codigo, Nivel, Nombre, Descripcion, Estado FROM Pla_Cta WHERE (Id = @Id)
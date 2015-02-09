﻿CREATE PROCEDURE dbo.Par_Servidor_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Descripcion varchar(2000),
	@Ruta varchar(500),
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000),
	@Original_Ruta varchar(500),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Par_Servidor] SET [Id] = @Id, [Codigo] = @Codigo, [Nombre] = @Nombre, [Descripcion] = @Descripcion, [Ruta] = @Ruta, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)) AND ([Ruta] = @Original_Ruta) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Nombre, Descripcion, Ruta, Estado FROM Par_Servidor WHERE (Id = @Id)
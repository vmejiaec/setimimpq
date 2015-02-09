﻿CREATE PROCEDURE dbo.Par_Tipo_Identificacion_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Int_Empresa_Id varchar(17),
	@Descripcion varchar(2000),
	@Estado char(3),
	@Cedula varchar(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Int_Empresa_Id varchar(17),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@IsNull_Cedula Int,
	@Original_Cedula varchar(3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Par_Tipo_Identificacion] SET [Id] = @Id, [Codigo] = @Codigo, [Nombre] = @Nombre, [Int_Empresa_Id] = @Int_Empresa_Id, [Descripcion] = @Descripcion, [Estado] = @Estado, [Cedula] = @Cedula WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Int_Empresa_Id] = @Original_Int_Empresa_Id) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Cedula = 1 AND [Cedula] IS NULL) OR ([Cedula] = @Original_Cedula)));
	
SELECT Id, Codigo, Nombre, Int_Empresa_Id, Descripcion, Estado, Cedula FROM Par_Tipo_Identificacion WHERE (Id = @Id)
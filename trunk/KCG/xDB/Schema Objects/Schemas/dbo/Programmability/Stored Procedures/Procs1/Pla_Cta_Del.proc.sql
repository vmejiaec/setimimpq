CREATE PROCEDURE [dbo].Pla_Cta_Del
(
	@Original_Id int,
	@Original_Anio char(4),
	@Original_Codigo varchar(200),
	@Original_Nivel char(3),
	@Original_Nombre varchar(500),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(1000),
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Pla_Cta] WHERE (([Id] = @Original_Id) AND ([Anio] = @Original_Anio) AND ([Codigo] = @Original_Codigo) AND ([Nivel] = @Original_Nivel) AND ([Nombre] = @Original_Nombre) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)) AND ([Estado] = @Original_Estado))
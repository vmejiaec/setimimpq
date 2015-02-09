CREATE PROCEDURE [dbo].Pla_Tarea_Del
(
	@Original_Id int,
	@Original_Codigo varchar(200),
	@Original_Pla_Cta_Id int,
	@Original_Nombre varchar(500),
	@Original_Fecha_Ini smalldatetime,
	@Original_Fecha_Fin smalldatetime,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Pla_Tarea] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Pla_Cta_Id] = @Original_Pla_Cta_Id) AND ([Nombre] = @Original_Nombre) AND ([Fecha_Ini] = @Original_Fecha_Ini) AND ([Fecha_Fin] = @Original_Fecha_Fin) AND ([Estado] = @Original_Estado))
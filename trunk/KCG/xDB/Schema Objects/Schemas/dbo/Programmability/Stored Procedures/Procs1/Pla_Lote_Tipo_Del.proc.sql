CREATE PROCEDURE [dbo].[Pla_Lote_Tipo_Del]
(
	@Original_Id int,
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Archivo_Tipo char(3),
	@Original_Clase varchar(100),
	@Original_Metodo varchar(100)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Pla_Lote_Tipo] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Archivo_Tipo] = @Original_Archivo_Tipo) AND ([Clase] = @Original_Clase) AND ([Metodo] = @Original_Metodo))

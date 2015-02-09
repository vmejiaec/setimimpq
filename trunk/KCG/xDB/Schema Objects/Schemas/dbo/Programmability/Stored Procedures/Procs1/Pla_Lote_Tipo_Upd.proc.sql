CREATE PROCEDURE [dbo].[Pla_Lote_Tipo_Upd]
(
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Archivo_Tipo char(3),
	@Clase varchar(100),
	@Metodo varchar(100),
	@Original_Id int,
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Archivo_Tipo char(3),
	@Original_Clase varchar(100),
	@Original_Metodo varchar(100),
	@Id int
)
AS
	SET NOCOUNT OFF;
UPDATE [Pla_Lote_Tipo] SET [Codigo] = @Codigo, [Nombre] = @Nombre, [Archivo_Tipo] = @Archivo_Tipo, [Clase] = @Clase, [Metodo] = @Metodo WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Archivo_Tipo] = @Original_Archivo_Tipo) AND ([Clase] = @Original_Clase) AND ([Metodo] = @Original_Metodo));
	
SELECT Id, Codigo, Nombre, Archivo_Tipo, Clase, Metodo FROM Pla_Lote_Tipo WHERE (Id = @Id)

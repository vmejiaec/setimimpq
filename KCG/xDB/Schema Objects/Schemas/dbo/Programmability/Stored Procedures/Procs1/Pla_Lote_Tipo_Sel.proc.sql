CREATE PROCEDURE [dbo].[Pla_Lote_Tipo_Sel]
AS
	SET NOCOUNT ON;
SELECT        Id, Codigo, Nombre, Archivo_Tipo, Clase, Metodo
FROM            Pla_Lote_Tipo

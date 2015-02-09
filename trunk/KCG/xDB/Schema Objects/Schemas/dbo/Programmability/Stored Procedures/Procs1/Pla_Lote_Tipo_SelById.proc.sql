create PROCEDURE [dbo].[Pla_Lote_Tipo_SelById]
(
	@p_Id int
)
AS
	SET NOCOUNT ON;
SELECT        Id, Codigo, Nombre, Archivo_Tipo, Clase, Metodo
FROM            Pla_Lote_Tipo
where Id = @p_Id

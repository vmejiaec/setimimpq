CREATE PROCEDURE [dbo].[Pla_Cta_Sel]
AS
	SET NOCOUNT ON;
SELECT        Id, Anio, Codigo, Nivel, Nombre, Descripcion, Estado
FROM            Pla_Cta
order by Anio,Codigo
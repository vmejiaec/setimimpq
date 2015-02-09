
CREATE PROCEDURE [dbo].[Ver_Version_OnlyPredeterminada]
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo, 
   Nombre,
   Abreviatura, 
   Predeterminada, 
   Ruta_Imagen, 
   Estado, 
   Descripcion,
   dbo.Dominio ('VER_VERSION','PREDETERMINADA',predeterminada, id) Predeterminada_Nombre,
   dbo.Estado ('VER_VERSION','ESTADO',estado, id) Estado_Nombre
FROM         Ver_Version
Where Predeterminada = 'S' 








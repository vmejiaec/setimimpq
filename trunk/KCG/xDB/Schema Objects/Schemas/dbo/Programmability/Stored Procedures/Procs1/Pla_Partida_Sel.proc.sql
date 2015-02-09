CREATE PROCEDURE [dbo].[Pla_Partida_Sel]
AS
	SET NOCOUNT ON;
SELECT        Id, Codigo, Nombre, Estado
FROM            Pla_Partida
order by Codigo
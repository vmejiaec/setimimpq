CREATE PROCEDURE [dbo].[V_INT_Area_Sel]
AS
	SET NOCOUNT ON;
SELECT        Codigo, Nombre
FROM            V_INT_Area
order by Nombre
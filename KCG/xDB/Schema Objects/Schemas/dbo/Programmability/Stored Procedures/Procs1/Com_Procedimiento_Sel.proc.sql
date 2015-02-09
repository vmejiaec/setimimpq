CREATE PROCEDURE [dbo].[Com_Procedimiento_Sel]
AS
	SET NOCOUNT ON;
SELECT        Id, Nombre, Tipo, Valor_Min, Valor_Max
FROM            Com_Procedimiento
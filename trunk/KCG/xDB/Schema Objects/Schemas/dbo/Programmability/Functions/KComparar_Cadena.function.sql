CREATE FUNCTION [dbo].[KComparar_Cadena]
(@cadena1 NVARCHAR (500), @cadena2 NVARCHAR (500))
RETURNS INT
AS
 EXTERNAL NAME [KComparar].[UserDefinedFunctions].[KST_Cadenas_Comparacion_Sensible]


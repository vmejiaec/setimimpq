CREATE PROCEDURE [dbo].[Com_DocTec_Sel]
AS
	SET NOCOUNT ON;
SELECT        Id, Nombre
FROM            Com_DocTec
order by Id
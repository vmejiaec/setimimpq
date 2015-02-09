CREATE PROCEDURE [dbo].[Ver_Version_existeRegistros]
AS
	SET NOCOUNT ON;
select count(*) as existeRegistros 
from ver_version

CREATE PROCEDURE [dbo].[Ver_Version_UpdatePredeterminadaN]
AS
	SET NOCOUNT ON;

update Ver_Version
set predeterminada = 'N'
 
select count(*) 
from ver_version
where predeterminada = 'S'



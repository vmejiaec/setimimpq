CREATE PROCEDURE [dbo].[Com_Contrato_Oferente_Sel]
AS
	SET NOCOUNT ON;
select 
  Id,
  Nombre,
  Fecha_Recepcion,
  Com_Contrato_Id,
  Per_Personal_Id_Recibe,
  Comentario
from Com_Contrato_Oferente 
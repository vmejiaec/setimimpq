create PROCEDURE [dbo].[Com_Contrato_Oferente_SelById]
(
	@p_Id int
)
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
where Id = @p_Id
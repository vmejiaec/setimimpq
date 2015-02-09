create PROCEDURE [dbo].[Com_Contrato_Oferente_SelByCom_Contrato_Id]
(
	@p_Com_Contrato_Id int
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
where Com_Contrato_Id = @p_Com_Contrato_Id
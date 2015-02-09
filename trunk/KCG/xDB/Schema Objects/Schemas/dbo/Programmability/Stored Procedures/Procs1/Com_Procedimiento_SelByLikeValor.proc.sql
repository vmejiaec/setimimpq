CREATE PROCEDURE [dbo].[Com_Procedimiento_SelByLikeValor]
(
	@p_Valor numeric(17, 2)
)
AS
	SET NOCOUNT ON;
SELECT        Id, Nombre, Tipo, Valor_Min, Valor_Max
FROM            Com_Procedimiento
where @p_Valor between Valor_Min and Valor_Max
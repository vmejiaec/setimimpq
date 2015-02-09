CREATE PROCEDURE [dbo].[Com_Procedimiento_SelById]
(
	@p_Id int
)
AS
	SET NOCOUNT ON;
SELECT        Id, Nombre, Tipo, Valor_Min, Valor_Max
FROM            Com_Procedimiento
where Id = @p_Id
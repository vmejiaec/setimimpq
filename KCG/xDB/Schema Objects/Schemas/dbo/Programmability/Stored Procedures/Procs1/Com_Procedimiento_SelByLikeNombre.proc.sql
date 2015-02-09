CREATE PROCEDURE [dbo].[Com_Procedimiento_SelByLikeNombre]
(
	@p_Nombre varchar(200)
)
AS
	SET NOCOUNT ON;
SELECT        Id, Nombre, Tipo, Valor_Min, Valor_Max
FROM            Com_Procedimiento
where Nombre like '%' + @p_Nombre + '%'
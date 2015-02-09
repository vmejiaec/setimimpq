create PROCEDURE [dbo].[V_INT_Area_SelByCodigo]
(
@p_Cogido varchar(50)
)
AS
	SET NOCOUNT ON;
SELECT        Codigo, Nombre
FROM            V_INT_Area
where Codigo = @p_Cogido
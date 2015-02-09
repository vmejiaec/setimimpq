create PROCEDURE [dbo].[Com_DocTec_SelByLikeNombre]
(
	@p_Nombre varchar(200)
)
AS
	SET NOCOUNT ON;
SELECT        Id, Nombre
FROM            Com_DocTec
where Nombre like '%' + @p_Nombre + '%'
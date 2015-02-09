create PROCEDURE [dbo].[Com_DocTec_SelById]
(
	@p_Id int
)
AS
	SET NOCOUNT ON;
SELECT        Id, Nombre
FROM            Com_DocTec
where Id = @p_Id
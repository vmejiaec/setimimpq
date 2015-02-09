
create PROCEDURE [dbo].[Pla_Cta_SelById]
(@p_Id int)
AS
	SET NOCOUNT ON;
SELECT        Id, Anio, Codigo, Nivel, Nombre, Descripcion, Estado
FROM            Pla_Cta
where Id = @p_Id
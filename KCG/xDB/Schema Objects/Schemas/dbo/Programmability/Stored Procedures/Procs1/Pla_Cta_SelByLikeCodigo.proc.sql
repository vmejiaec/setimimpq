
CREATE PROCEDURE [dbo].[Pla_Cta_SelByLikeCodigo]
( @p_Codigo varchar(20) )
AS
	SET NOCOUNT ON;
SELECT        Id, Anio, Codigo, Nivel, Nombre, Descripcion, Estado
FROM            Pla_Cta
where Codigo like @p_Codigo + '%'
order by Codigo
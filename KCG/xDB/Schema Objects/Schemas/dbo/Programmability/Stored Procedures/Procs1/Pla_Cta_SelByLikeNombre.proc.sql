
CREATE PROCEDURE [dbo].[Pla_Cta_SelByLikeNombre]
( @p_Nombre varchar(20) )
AS
	SET NOCOUNT ON;
SELECT        Id, Anio, Codigo, Nivel, Nombre, Descripcion, Estado
FROM            Pla_Cta
where UPPER(Nombre) like '%' + @p_Nombre + '%'
order by Codigo

CREATE PROCEDURE [dbo].[Pla_Cta_SelByAnioLikeNombre]
(	@p_Anio varchar(4),
	@p_Nombre varchar(20) )
AS
	SET NOCOUNT ON;
SELECT        Id, Anio, Codigo, Nivel, Nombre, Descripcion, Estado
FROM            Pla_Cta
where 
	Anio = @p_Anio
AND	UPPER(Nombre) like '%' + @p_Nombre + '%'
order by Nombre
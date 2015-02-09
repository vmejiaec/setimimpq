
create PROCEDURE [dbo].[Pla_Cta_SelByAnioLikeCodigo]
(	@p_Anio varchar(4),
	@p_Codigo varchar(20) )
AS
	SET NOCOUNT ON;
SELECT        Id, Anio, Codigo, Nivel, Nombre, Descripcion, Estado
FROM            Pla_Cta
where 
	Anio = @p_Anio 
AND	Codigo like @p_Codigo + '%'
order by Codigo
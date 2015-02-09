
CREATE PROCEDURE [dbo].[Pla_Cta_SelByAnio]
( @p_Anio varchar(4) )
AS
	SET NOCOUNT ON;
SELECT        Id, Anio, Codigo, Nivel, Nombre, Descripcion, Estado
FROM            Pla_Cta
where Anio = @p_Anio
order by Codigo
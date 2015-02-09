
create PROCEDURE [dbo].[Pla_Cta_SelNoRegistrosINT]
(@p_Anio varchar(4))
AS
	SET NOCOUNT ON;
SELECT        COUNT(*) NoRegistros
FROM            Pla_Cta
where Anio = @p_Anio
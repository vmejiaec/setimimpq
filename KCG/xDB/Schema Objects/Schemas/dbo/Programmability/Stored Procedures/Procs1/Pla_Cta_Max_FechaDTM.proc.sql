create PROCEDURE [dbo].[Pla_Cta_Max_FechaDTM]
(@p_Area_Solicita varchar(50))
AS
	SET NOCOUNT ON;
SELECT        max(d.Fecha) Max_Fecha
FROM            Pla_Doc d
where d.Area_Solicita = @p_Area_Solicita
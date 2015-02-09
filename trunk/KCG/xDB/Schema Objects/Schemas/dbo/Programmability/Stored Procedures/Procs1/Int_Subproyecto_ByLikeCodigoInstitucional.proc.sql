CREATE PROCEDURE [dbo].[Int_Subproyecto_ByLikeCodigoInstitucional]
(
	@p_Codigo_Institucional varchar(200)
)
AS
	SET NOCOUNT ON;


	SELECT 
		Codigo_Institucional,
		SPROY_NOMBRE
	FROM 	v_Int_Subproyecto
	Where Codigo_Institucional like @p_Codigo_Institucional
	

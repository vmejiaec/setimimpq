CREATE PROCEDURE [dbo].[Int_Subproyecto_Select]
AS
	SET NOCOUNT ON;


	SELECT 
		Codigo_Institucional,
		SPROY_NOMBRE
	FROM 	v_Int_Subproyecto



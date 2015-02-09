CREATE PROCEDURE [dbo].[Fis_Ampliacion_Select]
(
	@p_Ver_Version_Id VARCHAR(17)
)
AS
	SET NOCOUNT ON;
SELECT     
	Id, 
	Codigo, 
	Estado, 
	Descripcion, 
	Apu_Presupuesto_Id, 
	Nombre, 
	Fecha_Autorizacion, 
	Plazo_Dias,

	0 Plazo_Total_Prorroga,
	getdate() Fecha_Final_Prorroga,

	dbo.Estado('FIS_AMPLIACION', 'ESTADO', estado, @p_Ver_Version_Id) Estado_Nombre 

FROM Fis_Ampliacion
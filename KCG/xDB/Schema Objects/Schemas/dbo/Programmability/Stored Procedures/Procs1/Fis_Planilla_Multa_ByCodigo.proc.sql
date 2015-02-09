CREATE PROCEDURE [dbo].[Fis_Planilla_Multa_ByCodigo]
(
	@p_Ver_Version_Id VARCHAR(17),
	@p_Codigo VARCHAR(200)
)
AS
	SET NOCOUNT ON;
SELECT     
	Id, 
	Codigo, 
	Fis_Planilla_Id, 
	Fis_Multa_Id, 
	Valor, 
	Fecha, 
	Estado, 
	Descripcion,

	dbo.Fis_Planilla_Numero_Planilla(Fis_Planilla_Id) Fis_Planilla_Numero_Planilla,
	dbo.Fis_Planilla_Fecha_Ultimo_Ingreso(Fis_Planilla_Id) Fis_Planilla_Fecha_Ultimo_Ingreso,
	dbo.Fis_Planilla_Total(Fis_Planilla_Id) Fis_Planilla_Total,
	dbo.Dominio('FIS_PLANILLA', 'TIPO_PLANILLA', dbo.Fis_Planilla_Tipo_Planilla(Fis_Planilla_Id), @p_Ver_Version_Id) Fis_Planilla_Tipo_Nombre,

	dbo.Fis_Multa_Nombre(Fis_Multa_Id) Fis_Multa_Nombre,

	dbo.Estado('FIS_PLANILLA_MULTA', 'ESTADO', Estado, @p_Ver_Version_Id) Estado_Nombre	
	
FROM Fis_Planilla_Multa
WHERE Codigo = @p_Codigo
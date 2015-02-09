CREATE PROCEDURE [dbo].[Fis_Planilla_Det_Reporte_Select]
(
	@p_Ver_Version_Id varchar(17)
)
AS
	SET NOCOUNT ON;
BEGIN
	
	SELECT     
		FP.Id, 
		FP.Codigo, 
		FP.Estado, 
		FP.Descripcion, 
		FP.Apu_Prespuesto_Rubro_Id, 

		isnull(FP.Costo,0.00) Costo, 
		isnull(FP.Cantidad, 0.00) Cantidad,
		FP.Fis_Planilla_Id,
		Round(isnull((FP.Costo * FP.Cantidad),0),4) Costo_x_Cantidad,
		
		convert(numeric(17,2),0)	Cantidad_Anterior,
		convert(numeric(17,2),0)	Cantidad_Actual,
		convert(numeric(17,2),0)	Cantidad_Total,

		convert(numeric(17,2),0)	Importe_Anterior,
		convert(numeric(17,2),0)	Importe_Actual,
		convert(numeric(17,2),0)	Importe_Total,

		convert(numeric(17,2),0)	Incremento_Cantidad_1,
		convert(numeric(17,2),0)	Incremento_Importe_1,
		convert(numeric(17,2),0)	Incremento_Cantidad_2,
		convert(numeric(17,2),0)	Incremento_Importe_2,

		-------------------------- Datos de Apu_Prespuesto_Rubro ---------------------
		
		AP.Id Apu_Presupuesto_Rubro_Id,
		AP.Codigo Apu_Presupuesto_Rubro_Codigo,
		AP.Estado Apu_Presupuesto_Rubro_Estado,
		AP.Descripcion	Apu_Presupuesto_Rubro_Descripcion,
		AP.Apu_Presupuesto_Id Apu_Prespuesto_Id,
		AP.Apu_Rubro_Id Apu_Rubro_Id,
		AP.Apu_Rubro_Codigo Apu_Rubro_Codigo,
		AP.Apu_Rubro_Nombre Apu_Rubro_Nombre,
		AP.Apu_Rubro_Unidad Apu_Rubro_Unidad,
		AP.Apu_Rubro_Cantidad Apu_Rubro_Cantidad,
		AP.Costo_Unitario Apu_Rubro_Costo_Unitario,
		AP.Costo_Total Apu_Rubro_Costo_Total,
		AP.Apu_Subtitulo_Id Apu_Subtitulo_Id,
		dbo._Apu_Subtitulo_Nombre (AP.Apu_Subtitulo_Id) Apu_Subtitulo_Nombre,
		dbo._Apu_Subtitulo_Apu_Titulo_Id (AP.Apu_Subtitulo_Id) Apu_Titulo_Id,
		dbo._Apu_Titulo_Nombre (dbo._Apu_Subtitulo_Apu_Titulo_Id (AP.Apu_Subtitulo_Id)) Apu_Titulo_Nombre

	From Apu_Presupuesto_Rubro  AP
		Left join Fis_Planilla_Det FP
		On FP.Apu_Prespuesto_Rubro_Id = AP.Id

END



CREATE PROCEDURE [dbo].[Fis_Planilla_ByCodigo]
(
   @p_Ver_Version_Id varchar (17),
   @p_Codigo varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT      Id, 
			Codigo, 
			Estado, 
			Descripcion, 
			Tipo_Planilla, 
			Apu_Presupuesto_Id, 
			Fecha_Inicio_Ingreso, 
			Fecha_Inicial, 
			Fecha_Final, 
			Fecha_Ultimo_Ingreso, 
			Porcentaje_Iva, 
			Porcentaje_Retencion, 
			Fecha_Reajuste_Provisional, 
			Fecha_Reajuste_Definitivo, 
			Numero_Planilla, 
			Descripcion_Provisional, 
			Descripcion_Definitiva, 
			Anticipo_Devengar,

			Provisional_Fis_Catalogo_Id, 
			Definitivo_Fis_Catalogo_Id, 
			
			getdate() Fecha_Pago,
			
			dbo._Apu_Presupuesto_Apu_Origen_Id(Apu_Presupuesto_Id)Apu_Presupuesto_Apu_Origen_Id,
			dbo._Apu_Presupuesto_Codigo(Apu_Presupuesto_Id)Apu_Presupuesto_Codigo,
			dbo._Apu_Presupuesto_Nombre(Apu_Presupuesto_Id)Apu_Presupuesto_Nombre,

			dbo.Dominio('FIS_PLANILLA','Tipo_Planilla',Tipo_Planilla,@p_ver_version_id) Tipo_Nombre,
			dbo.Estado ('FIS_PLANILLA','ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre,

			dbo.Fis_Planilla_Total(Id) Total,
			dbo._Apu_Presupuesto_Codigo_Institucional1(Apu_Presupuesto_Id) Apu_Presupuesto_Codigo_Institucional,
			dbo._Per_Personal_Nombre (dbo._Apu_Presupuesto_Contratista_Per_Personal_Id(apu_Presupuesto_Id)) Contratista_Per_Personal_Nombre,

			--------------------------------------------------------------------------------------
			---------------- Campos que se adiconaron por el Reporte -----------------------------
			Year (Fecha_Inicial)							Fis_Planilla_Anio,
			convert(numeric(17,4),0)						Apu_Presupuesto_Costo_Total,
			100												Numero_Dias_Periodo,
			getDate()										Fecha_Contrato_Inicial,
			10												Apu_Presupuesto_Plazo,
 			getDate()										Fecha_Contrato_Final,
			-- Deduccion Anticipo = Total de las planillas * Porcentaje del anticipo / 100
			convert(numeric(17,4),0) Deduccion_Anticipo,

			ISNULL(dbo.Fis_Catalogo_Fecha_Publicacion(Provisional_Fis_Catalogo_Id),getdate()) Provisional_Fis_Catalogo_Fecha_Publicacion,
			ISNULL(dbo.Fis_Catalogo_Fecha_Publicacion(Provisional_Fis_Catalogo_Id),getdate()) Definitivo_Fis_Catalogo_Fecha_Publicacion

FROM       Fis_Planilla
WHERE Codigo = @p_Codigo

CREATE PROCEDURE [dbo].[Fis_Planilla_Select]
(
   -- Campos Obligatorios
   @p_Ver_Version_Id varchar (17),
   -- Campos Opcionales
   @p_Apu_Presupuesto_Codigo_Institucional varchar(200),
   @p_Apu_Presupuesto_Nombre varchar(500),
   @p_Contratista_Per_Personal_Nombre varchar(500),
   @p_Numero_Planilla_Desde	varchar(50),
   @p_Numero_Planilla_Hasta varchar(50),
   @p_Fecha_Inicial_Desde smalldatetime,
   @p_Fecha_Final_Hasta smalldatetime,
   @p_Tipo_Planilla varchar(3),
   @p_Total_Desde numeric(17,4),
   @p_Total_Hasta numeric(17,4),
   @p_Fecha_Pago_Desde smalldatetime,
   @p_Fecha_Pago_Hasta smalldatetime,
   -- Campos de Paginación Fina de Base de Datos
   @p_Numero_Registros int,
   @p_Pagina_Actual int
)
AS
	SET NOCOUNT ON;
BEGIN

if( @p_Apu_Presupuesto_Codigo_Institucional is null)
	set @p_Apu_Presupuesto_Codigo_Institucional = '%' ;
if( @p_Apu_Presupuesto_Nombre is null)
	set @p_Apu_Presupuesto_Nombre = '%' ;
if( @p_Contratista_Per_Personal_Nombre is null)
	set @p_Contratista_Per_Personal_Nombre = '%' ;
if( @p_Numero_Planilla_Desde is null)
	set @p_Numero_Planilla_Desde = '0' ;
if( @p_Numero_Planilla_Hasta is null)
	set @p_Numero_Planilla_Hasta = '99999999' ;

if( @p_Fecha_Inicial_Desde is null)
	set @p_Fecha_Inicial_Desde = '1900-01-01' ;
if( @p_Fecha_Final_Hasta is null)
	set @p_Fecha_Final_Hasta = '2078-01-01' ;

if( @p_Tipo_Planilla is null)
	set @p_Tipo_Planilla = '%' ;
if( @p_Total_Desde is null)
	set @p_Total_Desde = 0 ;
if( @p_Total_Hasta is null)
	set @p_Total_Hasta = 99999999.9999 ;
if( @p_Fecha_Pago_Desde is null)
	set @p_Fecha_Pago_Desde = '1900-01-01' ;
if( @p_Fecha_Pago_Hasta is null)
	set @p_Fecha_Pago_Hasta = '2078-01-01' ;

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
			convert(numeric(17,4),0) Deduccion_Anticipo,
			ISNULL(dbo.Fis_Catalogo_Fecha_Publicacion(Provisional_Fis_Catalogo_Id),getdate()) Provisional_Fis_Catalogo_Fecha_Publicacion,
			ISNULL(dbo.Fis_Catalogo_Fecha_Publicacion(Provisional_Fis_Catalogo_Id),getdate()) Definitivo_Fis_Catalogo_Fecha_Publicacion
			

	FROM
	(
		SELECT      
			Id, 
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

		    ROW_NUMBER() OVER (ORDER BY Codigo) AS RowNumber	

		    FROM  Fis_Planilla
			WHERE (@p_Apu_Presupuesto_Codigo_Institucional = '%' or dbo._Apu_Presupuesto_Codigo_Institucional1(Apu_Presupuesto_Id) like @p_Apu_Presupuesto_Codigo_Institucional)
			AND (@p_Apu_Presupuesto_Nombre = '%' or dbo._Apu_Presupuesto_Nombre(Apu_Presupuesto_Id) like @p_Apu_Presupuesto_Nombre )
			AND (@p_Contratista_Per_Personal_Nombre = '%' or dbo._Per_Personal_Nombre (dbo._Apu_Presupuesto_Contratista_Per_Personal_Id(apu_Presupuesto_Id)) like @p_Contratista_Per_Personal_Nombre )
			AND (Convert(numeric,Numero_Planilla) between @p_Numero_Planilla_Desde and @p_Numero_Planilla_Hasta )
			AND (Fecha_Inicial >= @p_Fecha_Inicial_Desde and Fecha_Final <= @p_Fecha_Final_Hasta)
			AND (@p_Tipo_Planilla = '%' or Tipo_Planilla like @p_Tipo_Planilla)
			AND (dbo.Fis_Planilla_Total(Id) between @p_Total_Desde and @p_Total_Hasta)
			AND (getdate() between @p_Fecha_Pago_Desde and @p_Fecha_Pago_Hasta)
		
	) Fis_Planilla
	WHERE  RowNumber > (@p_Numero_Registros * (@p_Pagina_Actual-1)) 
	AND RowNumber <= (@p_Numero_Registros * (@p_Pagina_Actual))
END
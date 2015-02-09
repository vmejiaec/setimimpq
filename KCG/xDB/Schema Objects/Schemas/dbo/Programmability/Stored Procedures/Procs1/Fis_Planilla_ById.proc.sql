CREATE PROCEDURE dbo.Fis_Planilla_ById
(
   @p_Ver_Version_Id varchar (17),
   @p_Id varchar (17)
)
AS
	SET NOCOUNT ON;
BEGIN

	DECLARE
		@p_Apu_Presupuesto_Id  varchar(17),
		@v_Apu_Presupuesto_Nombre varchar(500),
		@v_Apu_Presupuesto_Costo_Total numeric(17,2),
	    @v_Origen char(3),
	    @v_Apu_Origen_Id varchar(17),
		@v_Fecha_Contrato_Firma smalldatetime,
		@v_Plazo int,
		@v_Codigo_Institucional varchar(200),
		@p_Anticipo_Porcentaje numeric(5,2),
		@p_Anticipo_Valor numeric(17,4),
		@v_Tipo_Contrato varchar(3);
		


	---------------------------------------------------------------------------------------
	---------------- Se crea lac tabla temporal de Apu_Presupuesto-------------------------
	CREATE TABLE #Apu_Presupuesto(
		[Codigo_Institucional] [varchar](200) NULL,
		[Programa] [varchar](200)  NULL,
		[Tipo_Contrato_Legal] [varchar](200) NULL,
		[Ubicacion] [varchar](200) NULL,
		[Proyecto_Nombre] [varchar](200) NULL,
		[SubProyecto_Nombre] [varchar](200) NULL,
		[Categoria] [varchar](200) NULL,
		[Contratista_Cedula] [varchar](200) NULL,
		[Fecha_Contrato_Adjudicacion] [smalldatetime] NULL,
		[Fecha_Contrato_Firma] [smalldatetime] NULL,
		[Fecha_Oferta_Cierre] [smalldatetime] NULL,
		[Fecha_APU_Aprobacion] [smalldatetime] NULL,
		[Plazo] [int] NULL,
		[Anticipo_Porcentaje] [numeric](5, 2) NULL,
		[Coordinador1_Cedula] [varchar](200) NULL,
		[Coordinador2_Cedula] [varchar](200) NULL,
		[Contrato_Tipo] [varchar](200) NULL
	) 

	(SELECT @p_Apu_Presupuesto_Id = Id,
		   @v_Apu_Presupuesto_Nombre = Apu_Origen_Nombre,
		   @v_Apu_Presupuesto_Costo_Total = Costo_Total,
		   @v_Origen = Origen,
		   @v_Apu_Origen_Id = Apu_Origen_Id
	FROM Apu_Presupuesto
	WHERE Id in (Select Apu_Presupuesto_Id
				 FROM Fis_Planilla
				 WHERE Id = @p_Id))


	-- Se obtiene el Código Institucional
	set @v_Codigo_Institucional = dbo._Apu_Presupuesto_Codigo_Institucional(@v_Origen, @v_Apu_Origen_Id);
    set @v_Tipo_Contrato = dbo._Apu_Presupuesto_Tipo_Contrato(@v_Origen, @v_Apu_Origen_Id);

	--Obtener la información de Contratos para insertar el Presupuesto
	insert into  #Apu_Presupuesto
	exec dbo.Int_Contrato_ByCodigo_Institucional @v_Codigo_Institucional, @v_Tipo_Contrato;


	Select
		@v_Fecha_Contrato_Firma  = Fecha_Contrato_Firma,
		@v_Plazo				= Plazo,
		@p_Anticipo_Porcentaje   = Anticipo_Porcentaje
	From #Apu_Presupuesto
	Where Codigo_Institucional = @v_Codigo_Institucional

	-- Anticipo del proyecto
    Set @p_Anticipo_Valor=ISNULL(((@v_Apu_Presupuesto_Costo_Total * @p_Anticipo_Porcentaje)/100),0.00);

	
	
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
			
			getdate() Fecha_Pago,
			
			dbo._Apu_Presupuesto_Apu_Origen_Id(Apu_Presupuesto_Id)Apu_Presupuesto_Apu_Origen_Id,
			dbo._Apu_Presupuesto_Codigo(Apu_Presupuesto_Id)Apu_Presupuesto_Codigo,
			@v_Apu_Presupuesto_Nombre Apu_Presupuesto_Nombre,

			dbo.Dominio('FIS_PLANILLA','Tipo_Planilla',Tipo_Planilla,@p_ver_version_id) Tipo_Nombre,
			dbo.Estado ('FIS_PLANILLA','ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre,

			convert( numeric(17,2), round((CASE Tipo_Planilla WHEN 'ANT' THEN @p_Anticipo_Valor ELSE  dbo.Fis_Planilla_Total(Id) END),2)) Total,
			dbo._Apu_Presupuesto_Codigo_Institucional1(Apu_Presupuesto_Id) Apu_Presupuesto_Codigo_Institucional,
			dbo._Per_Personal_Nombre (dbo._Apu_Presupuesto_Contratista_Per_Personal_Id(apu_Presupuesto_Id)) Contratista_Per_Personal_Nombre,

			--------------------------------------------------------------------------------------
			---------------- Campos que se adiconaron por el Reporte -----------------------------
			Year (Fecha_Inicial)							Fis_Planilla_Anio,
			convert(numeric(17,2), round(@v_Apu_Presupuesto_Costo_Total,2))					Apu_Presupuesto_Costo_Total,
			Datediff (day,Fecha_Inicial, Fecha_Final)		Numero_Dias_Periodo,

			@v_Fecha_Contrato_Firma							Fecha_Contrato_Inicial,
			@v_Plazo										Apu_Presupuesto_Plazo,
 			dateadd (Day, @v_Plazo,	@v_Fecha_Contrato_Firma		) Fecha_Contrato_Final,

			-- Deduccion Anticipo = Anticpo - Anticipo Devengado
			@p_Anticipo_Valor - 

			(
				Select ISNULL(sum(Anticipo_Devengar),0)
				From Fis_Planilla FP
				Where FP.Apu_Presupuesto_Id = @p_Apu_Presupuesto_Id
				And convert(int,FP.Numero_Planilla) < convert(int,Fis_Planilla.Numero_Planilla)
			)	
			Deduccion_Anticipo,

			ISNULL(dbo.Fis_Catalogo_Fecha_Publicacion(Provisional_Fis_Catalogo_Id),getdate()) Provisional_Fis_Catalogo_Fecha_Publicacion,
			ISNULL(dbo.Fis_Catalogo_Fecha_Publicacion(Provisional_Fis_Catalogo_Id),getdate()) Definitivo_Fis_Catalogo_Fecha_Publicacion

	FROM       Fis_Planilla
	WHERE Id = @p_Id
END


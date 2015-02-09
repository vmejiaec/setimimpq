CREATE PROCEDURE dbo.Fis_Fiscalizacion_ByFisc
(
   @p_Ver_Version_Id varchar (17),
   @p_Id varchar(17)
)
AS
	SET NOCOUNT ON;
BEGIN
	
	DECLARE
		@v_Codigo_Institucional varchar(200),
		@v_Fecha_Contrato_Firma smalldatetime,
		@v_Contrato_Tipo varchar(200),
		@v_Fecha_APU_Aprobacion smalldatetime,
		@v_Fecha_Oferta_Cierre smalldatetime,
		@v_Fecha_Final smalldatetime,
		@v_Anticipo_Porcentaje numeric(17,4),
		@v_Tipo_Contrato_Legal varchar(200),
		@v_SubProyecto_Nombre varchar(200),
		@v_Proyecto_Nombre varchar(200),
		@v_Plazo int,
		@v_Coordinador1_Cedula varchar(200),
		@v_Coordinador2_Cedula varchar(200),
		@v_Programa varchar(200),
		@v_Coordinador1_Per_Personal_Nombre  varchar(200),
		@v_Coordinador2_Per_Personal_Nombre  varchar(200),
		@v_Ubicacion varchar(200),
		@v_Fecha_Indice_Base smalldatetime,
		@v_Fecha_Contrato_Adjudicacion smalldatetime,
		@v_Categoria varchar(200),
		@v_Origen char(3),
		@v_Apu_Origen_Id varchar(17),
		@v_Contratista_Cedula varchar(200),
		@v_Apu_Lugar_Nombre varchar(200),		
		@v_Publicacion_Base varchar(200),
		@v_Publicacion_Definitiva varchar(200),
		@v_Plazo_Prorroga int,
		@v_Plazo_Ampliacion int

	Select
		@v_Origen = Origen,
		@v_Apu_Origen_Id = Apu_Origen_Id
	From Apu_Presupuesto
	Where Id = @p_Id;

	-- Se crea lac tabla temporal
	CREATE TABLE #Apu_Presupuesto_Temporal(
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

	-- Se obtiene el Código Institucional
	set @v_Codigo_Institucional = dbo._Apu_Presupuesto_Codigo_Institucional(@v_Origen, @v_Apu_Origen_Id);
    set @v_Contrato_Tipo = dbo._Apu_Presupuesto_Tipo_Contrato(@v_Origen, @v_Apu_Origen_Id);

	--Obtener la información de Contratos para insertar el Presupuesto
	insert into  #Apu_Presupuesto_Temporal
	exec dbo.Int_Contrato_ByCodigo_Institucional @v_Codigo_Institucional, @v_Contrato_Tipo;


	select @v_Plazo_Prorroga =
			(Select  ISNULL(sum(Plazo_Dias),0)
			 From Fis_Ampliacion
			 Where Apu_Presupuesto_Id = @p_Id);

		
	Select -- Se obtiene la fecha final del proyecto
			@v_Fecha_Final =
					(case @v_Plazo_Prorroga
					When 0
			        Then ISNULL(dateadd (Day, (Plazo), Fecha_Contrato_Firma),getdate())
			        Else ISNULL(dateadd (Day, (Plazo-1), Fecha_Contrato_Firma),getdate()) End), 		   


			-- Se obtiene el Coordinador2
		   @v_Coordinador1_Per_Personal_Nombre	
				= dbo._Per_Personal_Nombre(dbo.Per_Personal_Id (Coordinador1_Cedula)),
			-- Se obtiene el Coordinador2
		   @v_Coordinador2_Per_Personal_Nombre	
				= dbo._Per_Personal_Nombre ( dbo.Per_Personal_Id (Coordinador2_Cedula)),
			-- Obtener el Lugar del Proyecto o de la Oferta
		   @v_Apu_Lugar_Nombre = dbo._Apu_Presupuesto_Lugar(@v_Origen,@v_Apu_Origen_Id),
			-- Tipo de Contrato
			--@v_contrato_Tipo = Contrato_Tipo,
			@v_SubProyecto_Nombre	=SubProyecto_Nombre,
			@v_Programa				= Programa,
			@v_Ubicacion			= Ubicacion,
			@v_Tipo_Contrato_Legal  = Tipo_Contrato_Legal,
			@v_Proyecto_Nombre      = Proyecto_Nombre,
			@v_Plazo				= ISNULL(Plazo,0),
			@v_Fecha_Oferta_Cierre   = Fecha_Oferta_Cierre,
			@v_Fecha_APU_Aprobacion  = Fecha_APU_Aprobacion,
			@v_Fecha_Contrato_Firma  = Fecha_Contrato_Firma,
			@v_Anticipo_Porcentaje   = Anticipo_Porcentaje,
			@v_Coordinador1_Cedula = Coordinador1_Cedula,
			@v_Coordinador2_Cedula = Coordinador2_Cedula
		--	@v_Contrato_Tipo       = Contrato_Tipo
	 From #Apu_Presupuesto_Temporal
	 Where Codigo_Institucional = @v_Codigo_Institucional


	-- Obtener la fecha_indice_base
	If (ltrim(rtrim(@v_Contrato_Tipo)) = '1') --PRINCIPAL
		-- Fecha Base = Fecha_CieRRE MENOS 30 DIAS
		set @v_Fecha_Indice_Base =	Dateadd (DAY, -30, isnull(@v_Fecha_Oferta_Cierre,getDate()))

	Else if ((ltrim(rtrim(@v_Contrato_Tipo))) = '2') --COMPLEMENTARIO
		set @v_Fecha_Indice_Base = @v_Fecha_APU_Aprobacion
	If (ltrim(rtrim(@v_Contrato_Tipo)) = '1') 
		set @v_Contrato_Tipo='Principal'
	Else 
		set @v_Contrato_Tipo='Complementario'

	-- Nombre de la publicacion base
	Select @v_Publicacion_Base =
		(Select Nombre 
		From Fis_Catalogo
		Where Fecha_Publicacion =
		(Select Max(Fecha_Publicacion) From Fis_Catalogo
		Where Fecha_Publicacion <= @v_Fecha_Indice_Base))

	
	Set @v_Plazo_Ampliacion=@v_Plazo_Prorroga;


		SELECT      
			Id, 
			Codigo, 
			Apu_Origen_Id, 
			Apu_Origen_Codigo, 
			Apu_Origen_Nombre, 
			Origen, 
			Costo_Directo, 
			convert(numeric(17,2),round(Costo_Total,2)) Costo_Total, 
			Costo_Indirecto, 
			Costo_Otros, 
			Equipo_Apu_Indice_Id, 
			ManoObra_Apu_Indice_Id, 
			Porcentaje_Costo_Indirecto, 
			Int_Sucursal_Id, 
			Apu_Mano_Obra_Id, 
			Estado, 

			Fiscalizador_Per_Personal_Id, -- Lo asigna ocn un combo en la página el Jede fe Fiscalización
			Contratista_Per_Personal_Id, --Se asigna la momento de insertar Apu_Presupuesto
			Fecha_Indices_Def, -- Es la fecha indice definitiva. El usuario debe ingresarla en la página.
			Fecha_Creacion,			--Campo de Auditoria
			Creacion_Per_Personal_Id, --Campo de Auditoria
			Fecha_Update, -- Campo de Auditoria
			Update_Per_Personal_Id, --Campo de Auditoría
			Tipo, --Campo que puede tener OFE -- PRO. Se asigna al crearse el registro
				
			@v_Codigo_Institucional Codigo_Institucion,
			@v_Contrato_Tipo Tipo_Contrato,		

			ISNULL(@v_Fecha_Oferta_Cierre, getdate())		Fecha_Cierre,
			ISNULL(@v_Fecha_APU_Aprobacion, getdate())		Fecha_APU,
			ISNULL(@v_Fecha_Contrato_Firma,getdate())		Fecha_Ini_Contrato,
			ISNULL(@v_Plazo,0)								Plazo_Contrato,

			ISNULL(@v_Fecha_Final,getdate())							Fecha_Fin_Contrato,
			convert(numeric(17,2),round( ISNULL( dbo.__Porcentaje_Cuatro_Decimales ( Costo_Total , @v_Anticipo_Porcentaje),0.00),2))	Valor_Anticipo,
			ISNULL(@v_Anticipo_Porcentaje,0.00)							Porcentaje_Anticipo,
			@v_Coordinador1_Per_Personal_Nombre			Coordinador_1,
			@v_Coordinador2_Per_Personal_Nombre			Coordinador_2,
			@v_Apu_Lugar_Nombre							Lugar,
			

			@v_Publicacion_Base Publicacion_Base,

			(Select Nombre 
			From Fis_Catalogo
			Where Fecha_Publicacion =
				(Select Max(Fecha_Publicacion) From Fis_Catalogo
				Where Fecha_Publicacion <= Fecha_Indices_Def))	Publicacion_Base_Def,


			--Campos para el recuadro de Codigo Institucional
			@v_Contrato_Tipo		Contrato_Tipo,
			@v_Proyecto_Nombre		Proyecto_Costos,
			@v_SubProyecto_Nombre	SubProyecto_Costos,
			@v_Programa				Programa_Costos,
			@v_Tipo_Contrato_Legal	Tipo_Contrato_Costos,
			@v_Ubicacion			Ubicacion_Costos,
			ISNULL(@v_Fecha_Indice_Base,getdate())    Fecha_Indice_Base,


			dbo._Per_Personal_Codigo(Creacion_Per_Personal_Id)Creacion_Per_Personal_Codigo,
			dbo._Per_Personal_Nombre(Creacion_Per_Personal_Id)Creacion_Per_Personal_Nombre,
			dbo._Per_Personal_Codigo(Update_Per_Personal_Id)Update_Per_Personal_Codigo,
			dbo._Per_Personal_Nombre(Update_Per_Personal_Id)Update_Per_Personal_Nombre,

			dbo._Per_Personal_Codigo(Fiscalizador_Per_Personal_Id)Fiscalizador_Per_Personal_Codigo,
			dbo._Per_Personal_Nombre(Fiscalizador_Per_Personal_Id)Fiscalizador_Per_Personal_Nombre,

			dbo._Per_Personal_Codigo(Contratista_Per_Personal_Id)Contratista_Per_Personal_Codigo,
			dbo._Per_Personal_Nombre(Contratista_Per_Personal_Id)Contratista_Per_Personal_Nombre,

			dbo.Per_Personal_Tipo_Fiscalizacion(Fiscalizador_Per_Personal_Id)Tipo_Fiscalizacion,

			dbo.Dominio('PER_PERSONAL','TIPO_FISCALIZADOR', dbo.Per_Personal_Tipo_Fiscalizacion(Fiscalizador_Per_Personal_Id), @p_Ver_Version_Id) Tipo_Fiscalizacion_Nombre, 

			'T' Jefe_Fiscalizacion,
			dbo.Dominio('PER_PERSONAL','JEFE_FISCALIZACION', 'T' , @p_Ver_Version_Id) Jefe_Fiscalizacion_Nombre,

			dbo.Dominio('APU_PRESUPUESTO','ORIGEN',Origen,@p_ver_version_id) Origen_Nombre,
			dbo.Estado ('APU_PRESUPUESTO','ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre,

			1.000 Coeficiente_Sumatoria,
			dbo._Apu_Presupuesto_Cuadrilla_Coeficiente(Id) Cuadrilla_Coeficiente_Sumatoria,
			dbo._Apu_Presupuesto_Cuadrilla_Costo_Total_Estado(Id,'DIS') SRD_x_Coeficiente_Sumatoria,

			--Añadido JPU  06-11-2009
			dbo._Apu_Presupuesto_Rubro_Costo_Total(Id,'DIS') Costo_Total_Dis,
			dbo._Apu_Presupuesto_Rubro_Costo_Total(Id,'REA') Costo_Total_Rea,
			dbo._Apu_Presupuesto_Cuadrilla_Costo_Total_Estado(Id,'REA') SRD_x_Coeficiente_Sumatoria_Rea,

			ISNULL(@v_Plazo_Ampliacion + @v_Plazo,0) Plazo_Ampliacion,
			ISNULL(DATEADD(Day,@v_Plazo_Ampliacion,@v_Fecha_Final),getdate())  Fecha_Final_Ampliacion,
			
			--Solo amplicacion del Plazo
			ISNULL(@v_Plazo_Ampliacion,0) Plazo_Ampliacion_Only


	FROM       Apu_Presupuesto
	WHERE Id=@p_Id

	drop table #Apu_Presupuesto_Temporal

END



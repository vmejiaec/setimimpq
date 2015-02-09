

CREATE PROCEDURE [dbo].[Apu_Proyecto_ById]
(
   @p_Ver_Version_Id varchar (17),
   @p_Id varchar (17)
)
AS
	SET NOCOUNT ON;


set nocount on 

--Obtencion de la Sumatoria de la Cuadrilla
	DECLARE @v_Costo_Total numeric(17, 4),
		@v_Coeficiente numeric(17, 3),
		@v_Costo_Total_Indice numeric(17, 4),
		@v_Coeficiente_Indice_Sum numeric(17, 3);
		
-- Se crea la tabla temporal
	CREATE TABLE #Apu_Proyecto_Cuadrilla(
		Id [numeric](18, 0) IDENTITY(1,1) NOT NULL,
		Apu_Proyecto_Id [varchar](17) NULL,
		Apu_proyecto_Codigo [varchar](200)  NULL,
		Apu_Proyecto_Nombre [varchar](200) NULL,
		Apu_proyecto_Etapa [varchar](3) NULL,
		Apu_Cuadrilla_Codigo [varchar](200) NULL,
		Apu_Cuadrilla_Nombre [varchar](500) NULL,
		Costo_Total [numeric](17, 4) NULL,
		Costo_Hora [numeric](17, 2) NULL,
		Numero_trabajadores [numeric](17, 2) NULL,
		Coeficiente [numeric](17, 3) NULL,
		Apu_Categoria_Id [varchar](17) NULL,
		Origen [varchar](3) NULL
	) 

	insert into  #Apu_Proyecto_Cuadrilla
	exec  dbo.Apu_Proyecto_Cuadrilla_Select @p_Id;

	Select @v_Costo_Total =ISNULL(sum(Costo_Total),0),
			@v_Coeficiente = ISNULL(sum(Coeficiente),0)
	From #Apu_Proyecto_Cuadrilla
	Where Apu_Proyecto_Id=@p_Id


-- Se crea la tabla temporal
	CREATE TABLE #Apu_Proyecto_Indice(
		Apu_Proyecto_Id [varchar](17) NULL,
		Apu_proyecto_Codigo [varchar](200)  NULL,
		Apu_Proyecto_Nombre [varchar](200) NULL,
		Apu_proyecto_Etapa [varchar](3) NULL,
		Apu_Indice_Nombre [varchar](500) NULL,
		Apu_Indice_Codigo [varchar](200) NULL,
		Costo_Total [numeric](17, 4) NULL,
		Coeficiente [numeric](17, 3) NULL,
		Letra [char](1) NULL
	) 
	insert into  #Apu_Proyecto_Indice
	exec  dbo.Apu_Proyecto_Indice_Select @p_Id;

	Select @v_Costo_Total_Indice =ISNULL(sum(Costo_Total),0),
			@v_Coeficiente_Indice_Sum = ISNULL(sum(Coeficiente),0)
	From #Apu_Proyecto_Indice
	Where Apu_Proyecto_Id=@p_Id

	drop table #Apu_Proyecto_Cuadrilla



SELECT  Id, 
		Codigo, 
		Codigo_Institucion, 
		Nombre, 
		Apu_Lugar_Id, 
		Area, 
		Porcentaje_Costo_Indirecto, 
		Porcentaje_Costo_Otros, 
		Fecha_Creacion, 
		Coordinador_Per_Personal_Id, 
		Tecnico_Per_Personal_Id, 
		Etapa, 
		Int_Sucursal_Id, 
		Int_Moneda_Id, 
		Fecha_Update, 
		Creacion_Per_Personal_Id, 
		Update_Per_Personal_Id, 
		Estado, 
		Costo_Directo, 
		Costo_Total, 
		Costo_Indirecto, 
		Costo_Otros, 
		Descripcion, 
		Tipo_Contrato,
	
	dbo._Apu_Lugar_Codigo(Apu_Lugar_Id) AS Apu_Lugar_Codigo, 
	dbo._Apu_Lugar_Nombre(Apu_Lugar_Id) AS Apu_Lugar_Nombre, 
	dbo._Apu_Lugar_Apu_Provincia_Id(Apu_Lugar_Id) AS Apu_provincia_id, 
    dbo._Apu_Provincia_Codigo(dbo._Apu_Lugar_Apu_Provincia_Id(Apu_Lugar_Id)) AS Apu_Provincia_Codigo, 
	dbo._Apu_Provincia_Nombre(dbo._Apu_Lugar_Apu_Provincia_Id(Apu_Lugar_Id)) AS Apu_Provincia_Nombre, 
	dbo._Int_Sucursal_Codigo(Int_Sucursal_Id) AS Int_Sucursal_Codigo, 
	dbo._Int_Sucursal_Nombre(Int_Sucursal_Id) AS Int_Sucursal_Nombre, 
	dbo._Int_Sucursal_Int_Empresa_Id(Int_Sucursal_Id) AS Int_Empresa_Id, 
	dbo._Int_Empresa_Codigo(dbo._Int_Sucursal_Int_Empresa_Id(Int_Sucursal_Id)) AS Int_Empresa_Codigo, 
	dbo._Int_Empresa_Nombre(dbo._Int_Sucursal_Int_Empresa_Id(Int_Sucursal_Id)) AS Int_Empresa_Nombre, 
	dbo._Per_Personal_Codigo(Creacion_Per_Personal_Id) AS Creacion_Per_Personal_Codigo, 
	dbo._Per_Personal_Nombre(Creacion_Per_Personal_Id) AS Creacion_Per_Personal_Nombre, 
	dbo._Per_Personal_Codigo(Update_Per_Personal_Id) AS Update_Per_Personal_Codigo, 
	dbo._Per_Personal_Nombre(Update_Per_Personal_Id) AS Update_Per_Personal_Nombre, 
	dbo._Per_Personal_Codigo(Coordinador_Per_Personal_Id) AS Coordinador_Per_Personal_Codigo, 
	dbo._Per_Personal_Nombre(Coordinador_Per_Personal_Id) AS Coordinador_Per_Personal_Nombre, 
	dbo._Per_Personal_Codigo(Tecnico_Per_Personal_Id) AS Tecnico_Per_Personal_Codigo, 
	dbo._Per_Personal_Nombre(Tecnico_Per_Personal_Id) AS Tecnico_Per_Personal_Nombre, 
	dbo._Int_Moneda_Codigo(Int_Moneda_Id) AS Int_Moneda_Codigo, 
	dbo._Int_Moneda_Nombre(Int_Moneda_Id) AS Int_Moneda_Nombre, 
	dbo._Int_Moneda_Simbolo(Int_Moneda_Id) AS Int_Moneda_Simbolo,
    
	dbo._Apu_Proyecto_Costo_Equipo (id) AS Costo_Equipo,

    --dbo._Apu_Proyecto_Costo_Mano_Obra	(id) AS Costo_Mano_Obra,
	dbo._Apu_Proyecto_Costo_Mano_Obra_Cuadrilla	(id) AS Costo_Mano_Obra,

    dbo._Apu_Proyecto_Costo_Material	(id) Costo_Material,
    dbo._Apu_Proyecto_Costo_Transporte	(id) Costo_Transporte,

    dbo._Apu_Proyecto_Costo_Metro_Cuadrado	(id) Costo_Metro_Cuadrado,

    dbo._Apu_Proyecto_Costo_Indirecto_Otros (id) Costo_Indirecto_Otros,
    dbo._Apu_Proyecto_Porcentaje_Costo_Indirecto_Otros	(Id)  Porcentaje_Costo_Indirecto_Otros, 

    @v_Costo_Total_Indice Indice_Sumatoria,
    @v_Coeficiente_Indice_Sum Coeficiente_Sumatoria,
    
	@v_Costo_Total Cuadrilla_Sumatoria,

	@v_Coeficiente Cuadrilla_Coeficiente_Sumatoria,

    dbo._Apu_Proyecto_Transporte_Suma_Porcentaje (Id) Suma_Porcentaje_Indice_Transporte,
 
    dbo.Dominio('APU_PROYECTO','ETAPA',Etapa,@p_ver_version_id) Etapa_Nombre,
    dbo.Estado ('APU_PROYECTO','ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre,

	'' Cadena_Indice,
	
	'' Cadena_Cuadrilla,

	dbo._Apu_Presupuesto_Estado(Id) Apu_Presupuesto_Estado,
    dbo.Estado ('APU_PRESUPUESTO','ESTADO', dbo._Apu_Presupuesto_Estado(Id), @p_ver_version_Id) Apu_Presupuesto_Estado_Nombre,
	dbo.Dominio('APU_PROYECTO','TIPO_CONTRATO',Tipo_Contrato,@p_ver_version_id) Tipo_Nombre

FROM         Apu_Proyecto
Where  Id = @p_Id





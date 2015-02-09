CREATE PROCEDURE dbo.Apu_Oferta_ById
(
   @p_Ver_Version_Id varchar (17),
   @p_Apu_Oferta_Id varchar (17) 
)
AS
	SET NOCOUNT ON;

--Obtencion de la Sumatoria de la Cuadrilla
	DECLARE 	@v_Apu_Oferta_Id varchar(17),
		@v_Apu_Oferta_Codigo varchar(200),
		@v_Apu_Oferta_Nombre varchar(200) ,
		@v_Apu_Oferta_Etapa varchar(3),
		@v_Apu_Cuadrilla_Codigo varchar(200),
		@v_Apu_Cuadrilla_Nombre varchar(500),
		@v_Costo_Total numeric(17, 4),
		@v_Costo_Hora numeric(17, 2),
		@v_Numero_trabajadores numeric(17, 2),
		@v_Coeficiente numeric(17, 2),
		@v_Apu_Categoria_Id varchar(17),
		@v_Origen varchar(3)
		
-- Se crea la tabla temporal
	CREATE TABLE #Apu_Oferta_Temporal(
		Apu_Oferta_Id [varchar](17) NULL,
		Apu_Oferta_Codigo [varchar](200)  NULL,
		Apu_Oferta_Nombre [varchar](200) NULL,
		Apu_Oferta_Etapa [varchar](3) NULL,
		Apu_Cuadrilla_Codigo [varchar](200) NULL,
		Apu_Cuadrilla_Nombre [varchar](500) NULL,
		Costo_Total [numeric](17, 4) NULL,
		Costo_Hora [numeric](17, 2) NULL,
		Numero_trabajadores [numeric](17, 2) NULL,
		Coeficiente [numeric](17, 2) NULL,
		Apu_Categoria_Id [varchar](17) NULL,
		Origen [varchar](3) NULL
	) 

	insert into  #Apu_Oferta_Temporal
	exec  dbo.Apu_Oferta_Cuadrilla_Select @p_Apu_Oferta_Id;
	Select @v_Apu_Oferta_Id = Apu_Oferta_Id,
		@v_Apu_Oferta_Codigo =Apu_Oferta_Codigo,
		@v_Apu_Oferta_Nombre =Apu_Oferta_Nombre ,
		@v_Apu_Oferta_Etapa =Apu_Oferta_Etapa,
		@v_Apu_Cuadrilla_Codigo =Apu_Cuadrilla_Codigo,
		@v_Apu_Cuadrilla_Nombre =Apu_Cuadrilla_Nombre,
		@v_Costo_Total =Costo_Total,
		@v_Costo_Hora =Costo_Hora,
		@v_Numero_trabajadores =Numero_trabajadores,
		@v_Coeficiente =Coeficiente,
		@v_Apu_Categoria_Id =Apu_Categoria_Id,
		@v_Origen =Origen
	From #Apu_Oferta_Temporal
	Where Apu_Oferta_Id=@p_Apu_Oferta_Id

	Select  @v_Costo_Total=Isnull(Sum(Costo_Total),0)
	From #Apu_Oferta_Temporal
	Where Apu_Oferta_Id=@p_Apu_Oferta_Id




	drop table #Apu_Oferta_Temporal


SELECT  Id, 
		Codigo, 
		Nombre, 
		Apu_Lugar_Id, 
		Area, 
		Porcentaje_Costo_Indirecto, 
		Porcentaje_Costo_Otros, 
		Fecha_Creacion, 
		Creacion_Per_Personal_Id, 
		Fecha_Update, 
		Update_Per_Personal_Id, 
		Contratista, 
		Tecnico_Per_Personal_Id, 
		Etapa, 
		Int_Sucursal_Id, 
		Int_Moneda_Id, 
		Estado, 
		Descripcion, 
		Codigo_Institucion, 
		Tipo_Contrato,
	
	dbo._Apu_Lugar_Codigo (apu_lugar_id) Apu_Lugar_Codigo,
	dbo._Apu_Lugar_Nombre (apu_lugar_id) Apu_Lugar_Nombre,

	dbo._Apu_Lugar_Apu_Provincia_Id (apu_lugar_id) Apu_provincia_id,
    dbo._Apu_Provincia_Codigo (dbo._Apu_Lugar_Apu_Provincia_Id (apu_lugar_id)) Apu_Provincia_Codigo,
    dbo._Apu_Provincia_Nombre (dbo._Apu_Lugar_Apu_Provincia_Id (apu_lugar_id)) Apu_Provincia_Nombre,
   
    dbo._Int_Sucursal_Codigo (Int_Sucursal_Id) Int_Sucursal_Codigo,
    dbo._Int_Sucursal_Nombre (Int_Sucursal_Id) Int_Sucursal_Nombre,

    dbo._Int_Sucursal_Int_Empresa_Id (Int_Sucursal_Id) Int_Empresa_Id,
    dbo._Int_Empresa_Codigo (dbo._Int_Sucursal_Int_Empresa_Id (Int_Sucursal_Id)) Int_Empresa_Codigo,
    dbo._Int_Empresa_Nombre (dbo._Int_Sucursal_Int_Empresa_Id (Int_Sucursal_Id)) Int_Empresa_Nombre,

    dbo._Per_Personal_Codigo (Creacion_Per_Personal_Id) Creacion_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Creacion_Per_Personal_Id) Creacion_Per_Personal_Nombre,
    
    dbo._Per_Personal_Codigo (Update_Per_Personal_Id) Update_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Update_Per_Personal_Id) Update_Per_Personal_Nombre,
     
    dbo._Per_Personal_Codigo (Tecnico_Per_Personal_Id) Tecnico_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Tecnico_Per_Personal_Id) Tecnico_Per_Personal_Nombre,
     
    dbo._Int_Moneda_Codigo  (Int_Moneda_Id) Int_Moneda_Codigo,
    dbo._Int_Moneda_Nombre  (int_Moneda_Id) Int_Moneda_Nombre,
    dbo._Int_Moneda_Simbolo (int_Moneda_Id) Int_Moneda_Simbolo,
    
	dbo._Apu_Oferta_Costo_Equipo (id) Costo_Equipo,

--    dbo._Apu_Oferta_Costo_Mano_Obra (id) Costo_Mano_Obra,
	dbo._Apu_Oferta_Costo_Mano_Obra_Cuadrilla (Id) Costo_Mano_Obra,

    dbo._Apu_Oferta_Costo_Material (id) Costo_Material,
    dbo._Apu_Oferta_Costo_Transporte (id) Costo_Transporte,

    dbo._Apu_Oferta_Costo_Directo   (id) Costo_Directo,
    dbo._Apu_Oferta_Costo_Indirecto (id) Costo_Indirecto,
    dbo._Apu_Oferta_Costo_Otros     (id) Costo_Otros,
--  Comentado JPU
--    dbo._Apu_Oferta_Costo_Total (id) Costo_Total,  
    dbo._Apu_Oferta_Costo_Total_1 (id) Costo_Total,  
 
    dbo._Apu_Oferta_Costo_Metro_Cuadrado (id) Costo_Metro_Cuadrado,
    dbo._Apu_Oferta_Costo_Indirecto_Otros (id) Costo_Indirecto_Otros,
    dbo._Apu_Oferta_Porcentaje_Costo_Indirecto_Otros (Id) Porcentaje_Costo_Indirecto_Otros, 
	
 --dbo._Apu_Oferta_Costo_Directo   (id) Indice_Sumatoria,
    dbo._Apu_Oferta_Indice_Sumatoria (Id) Indice_Sumatoria,

    dbo._Apu_Oferta_Indice_Sumatoria_Coef(Id) Coeficiente_Sumatoria,

--    dbo._Apu_Oferta_Costo_Mano_Obra_Cuadrilla (Id) Cuadrilla_Sumatoria,
	@v_Costo_Total Cuadrilla_Sumatoria,

    dbo._Apu_Oferta_Cuadrilla_Coeficiente_Sumatoria1 (id) Cuadrilla_Coeficiente_Sumatoria,

    dbo._Apu_Oferta_Transporte_Suma_Porcentaje (id) Suma_Porcentaje_Indice_Transporte,
 
    dbo.Dominio('APU_OFERTA','ETAPA' , Etapa,  @p_ver_version_id) Etapa_Nombre,
    dbo.Estado ('APU_OFERTA','ESTADO', Estado, @p_ver_version_Id) Estado_Nombre,
	dbo._Apu_Oferta_Cadena_Indice (id) Cadena_Indice,
	dbo._Apu_Oferta_Cadena_Cuadrilla (id) Cadena_Cuadrilla,

	dbo._Apu_Presupuesto_Estado(Id) Apu_Presupuesto_Estado,
    dbo.Estado ('APU_PRESUPUESTO','ESTADO', dbo._Apu_Presupuesto_Estado(Id), @p_ver_version_Id) Apu_Presupuesto_Estado_Nombre,
    dbo.Dominio('APU_OFERTA','TIPO_CONTRATO' , Tipo_Contrato,  @p_ver_version_id) Tipo_Nombre


FROM         Apu_Oferta
where id = @p_Apu_Oferta_Id


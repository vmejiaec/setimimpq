
CREATE PROCEDURE [dbo].[Apu_Oferta_BySucursal]
(
   @p_Ver_Version_Id varchar (17),
   @p_Int_Sucursal_id varchar(17) ,
   @p_Numero_Registros int,
   @p_Pagina_Actual int,
   @p_Codigo_Desde varchar(200),
   @p_Codigo_Hasta varchar(200),
   @p_Estado varchar(3),
   @p_Nombre varchar(500),
   @p_Contratista varchar(500),
   @p_Tecnico_Per_Personal_Nombre varchar(500),
   @p_Apu_Lugar_Nombre varchar(500),
   @p_Apu_Provincia_Nombre varchar(500),
   @p_Apu_Presupuesto_Estado varchar(500)

)
AS
	SET NOCOUNT ON;

if (@p_Codigo_Desde is null)
begin
	select @p_Codigo_Desde=MIN(CONVERT (numeric, codigo))
	from Apu_Oferta
end

if (@p_Codigo_Hasta is null)
begin
	select @p_Codigo_Hasta=MAX(CONVERT (numeric, codigo))
	from Apu_Oferta
end

if (@p_Estado is null)
	set @p_Estado='%'
if (@p_Nombre is null)
	set @p_Nombre='%'
if (@p_Contratista is null)
	set @p_Contratista='%'
if (@p_Tecnico_Per_Personal_Nombre is null)
	set @p_Tecnico_Per_Personal_Nombre='%'
if (@p_Apu_Lugar_Nombre is null)
	set @p_Apu_Lugar_Nombre='%'
if (@p_Apu_Provincia_Nombre is null)
	set @p_Apu_Provincia_Nombre ='%'

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
    
	--dbo._Apu_Oferta_Costo_Equipo (id) 
		0.0 Costo_Equipo,
    --dbo._Apu_Oferta_Costo_Mano_Obra (id) 
		0.0 Costo_Mano_Obra,
    --dbo._Apu_Oferta_Costo_Material (id) 
		0.0 Costo_Material,
    --dbo._Apu_Oferta_Costo_Transporte (id) 
		0.0 Costo_Transporte,

    dbo._Apu_Oferta_Costo_Directo   (id) 
		--0.0 
		Costo_Directo,
    --dbo._Apu_Oferta_Costo_Indirecto (id) 
		0.0 Costo_Indirecto,
    --dbo._Apu_Oferta_Costo_Otros     (id) 
		0.0 Costo_Otros,
    dbo._Apu_Oferta_Costo_Total_1 (id) 
		--0.0 
		Costo_Total,  
 
    --dbo._Apu_Oferta_Costo_Metro_Cuadrado (id) 
		0.0 Costo_Metro_Cuadrado,
    --dbo._Apu_Oferta_Costo_Indirecto_Otros (id) 
		0.0 Costo_Indirecto_Otros,
    --dbo._Apu_Oferta_Porcentaje_Costo_Indirecto_Otros (Id) 
		0.0 Porcentaje_Costo_Indirecto_Otros, 
	--dbo._Apu_Oferta_Costo_Directo   (id) 
		0.0 Indice_Sumatoria,
    --dbo._Apu_Oferta_Indice_Sumatoria (Id) Indice_Sumatoria,
    --dbo._Apu_Oferta_Indice_Sumatoria_Coef(Id) 
		0.0 Coeficiente_Sumatoria,
    --dbo._Apu_Oferta_Costo_Mano_Obra_Cuadrilla (Id) 
		0.0 Cuadrilla_Sumatoria,
    --dbo._Apu_Oferta_Cuadrilla_Coeficiente_Sumatoria1 (id) 
		0.0 Cuadrilla_Coeficiente_Sumatoria,

    --dbo._Apu_Oferta_Transporte_Suma_Porcentaje (id) 
		0.0 Suma_Porcentaje_Indice_Transporte,
 
    dbo.Dominio('APU_OFERTA','ETAPA' , Etapa,  @p_ver_version_id) Etapa_Nombre,
    dbo.Estado ('APU_OFERTA','ESTADO', Estado, @p_ver_version_Id) Estado_Nombre,

	--dbo._Apu_Oferta_Cadena_Indice (id) 
		'' Cadena_Indice,
	--dbo._Apu_Oferta_Cadena_Cuadrilla (id) 
		'' Cadena_Cuadrilla,

	dbo._Apu_Presupuesto_Estado(Id) Apu_Presupuesto_Estado,
    dbo.Estado ('APU_PRESUPUESTO','ESTADO', dbo._Apu_Presupuesto_Estado(Id), @p_ver_version_Id) Apu_Presupuesto_Estado_Nombre,
    dbo.Dominio('APU_OFERTA','TIPO_CONTRATO' , Tipo_Contrato,  @p_ver_version_id) Tipo_Nombre


FROM       
(
SELECT     
    Id,
    Codigo, 
    Nombre,
    Apu_Lugar_id, 
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

	ROW_NUMBER() OVER (ORDER BY convert(numeric,Codigo) desc) AS RowNumber 
	FROM Apu_Oferta
	Where Int_sucursal_Id = @p_int_sucursal_id 
	AND ( convert(numeric,Codigo) between convert(numeric,@p_Codigo_Desde) and convert(numeric,@p_Codigo_Hasta))
	and (@p_Estado='%' OR  Estado like @p_Estado)
	AND (@p_Nombre ='%'  OR Nombre like @p_Nombre)
	--and (@p_Contratista ='%'  OR Contratista like @p_Contratista )
	--and (@p_Tecnico_Per_Personal_Nombre ='%'  OR dbo._Per_Personal_Nombre(Tecnico_Per_Personal_Id) like @p_Tecnico_Per_Personal_Nombre)
	--and (@p_Apu_Lugar_Nombre ='%'  OR dbo._Apu_Lugar_Nombre(Apu_Lugar_Id) like @p_Apu_Lugar_Nombre)
	--and (@p_Apu_Provincia_Nombre ='%'  OR dbo._Apu_Provincia_Nombre(dbo._Apu_Lugar_Apu_Provincia_Id(Apu_Lugar_Id)) like @p_Apu_Provincia_Nombre)
	--and (@p_Apu_Presupuesto_Estado='%' OR dbo._Apu_Presupuesto_Estado(Id) like @p_Apu_Presupuesto_Estado)

)
  Apu_Oferta
where  RowNumber > (@p_Numero_Registros* (@p_Pagina_Actual-1)) 
and RowNumber <= (@p_Numero_Registros * (@p_Pagina_Actual))
ORDER BY convert(numeric,Codigo) desc
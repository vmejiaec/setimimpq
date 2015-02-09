

CREATE PROCEDURE [dbo].[Apu_Proyecto_BySucursal]
(
   @p_Ver_Version_Id varchar (17),
   @p_Int_sucursal_id varchar (17),
   @p_Numero_Registros int,
   @p_Pagina_Actual int,
   @p_Codigo_Desde varchar(200),
   @p_Codigo_Hasta varchar(200),
   @p_Estado varchar(3),
   @p_Nombre varchar(500),
   @p_Fecha_Creacion_Desde smalldatetime,
   @p_Fecha_Creacion_Hasta smalldatetime,
   @p_Coordinador_Per_Personal_Nombre varchar(500),
   @p_Tecnico_Per_Personal_Nombre varchar(500),
   @p_Apu_Lugar_Nombre  varchar(500),
   @p_Apu_Provincia_Nombre varchar(500),
   @p_Apu_Presupuesto_Estado varchar(500)

)
AS

SET NOCOUNT ON;


if (@p_Codigo_Desde is null)
	set @p_Codigo_Desde='0';

if (@p_Codigo_Hasta is null)
	set @p_Codigo_Hasta='999999999999';

if (@p_Estado is null)
	set @p_Estado='%';

if (@p_Nombre is null)
	set @p_Nombre='%';

if (@p_Fecha_Creacion_Desde =null)
		set @p_Fecha_Creacion_Desde = convert(smalldatetime,'01/01/1900');
--
if (@p_Fecha_Creacion_Hasta =null)
		set @p_Fecha_Creacion_Hasta = convert(smalldatetime,'01/01/2078');

if (@p_Coordinador_Per_Personal_Nombre is null)
	set @p_Coordinador_Per_Personal_Nombre='%'

if (@p_Tecnico_Per_Personal_Nombre is null)
	set @p_Tecnico_Per_Personal_Nombre='%';

if (@p_Apu_Lugar_Nombre is null)
	set @p_Apu_Lugar_Nombre='%'

if (@p_Apu_Provincia_Nombre is null)
	set @p_Apu_Provincia_Nombre='%'


if (@p_Apu_Presupuesto_Estado is null)
	set @p_Apu_Presupuesto_Estado='%';

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

	--dbo._int_sucursal_Codigo(Int_Sucursal_Id) AS 
    ' 'Int_Sucursal_Codigo, 
	--dbo._int_sucursal_Nombre(Int_Sucursal_Id) AS 
    ' 'Int_Sucursal_Nombre, 
	--dbo._int_sucursal_int_empresa_id(Int_Sucursal_Id) AS 
    ' 'Int_Empresa_Id, 
	--dbo._int_empresa_Codigo(dbo._int_sucursal_int_empresa_id(Int_Sucursal_Id)) AS 
    ' 'Int_Empresa_Codigo, 
	--dbo._int_empresa_Nombre(dbo._int_sucursal_int_empresa_id(Int_Sucursal_Id)) AS 
    ' 'Int_Empresa_Nombre, 
    
	--dbo._per_personal_Codigo(Creacion_Per_Personal_Id) AS 
    ' ' Creacion_Per_Personal_Codigo, 
	--dbo._per_personal_Nombre(Creacion_Per_Personal_Id) AS 
    ' 'Creacion_Per_Personal_Nombre, 
	--dbo._per_personal_Codigo(Update_Per_Personal_Id) AS 
    ' 'Update_Per_Personal_Codigo, 
	--dbo._per_personal_Nombre(Update_Per_Personal_Id) AS 
    ' 'Update_Per_Personal_Nombre, 
	--dbo._per_personal_Codigo(Coordinador_Per_Personal_Id) AS 
    ' 'Coordinador_Per_Personal_Codigo, 

	dbo._Per_Personal_Nombre(Coordinador_Per_Personal_Id) AS Coordinador_Per_Personal_Nombre, 

	--dbo._per_personal_Codigo(Tecnico_Per_Personal_Id) AS 
    ' 'Tecnico_Per_Personal_Codigo, 

	dbo._Per_Personal_Nombre(Tecnico_Per_Personal_Id) AS Tecnico_Per_Personal_Nombre, 

	--dbo._int_moneda_Codigo(Int_Moneda_Id) AS 
    ' 'Int_Moneda_Codigo, 

	--dbo._int_moneda_Nombre(Int_Moneda_Id) AS 
    ' 'Int_Moneda_Nombre, 

	--dbo._int_moneda_simbolo(Int_Moneda_Id) AS 
    ' 'Int_Moneda_Simbolo,
    
	--dbo._Apu_Proyecto_Costo_Equipo (id) 
    0.0000 Costo_Equipo,

    --dbo._Apu_Proyecto_Costo_Mano_Obra (id) 
    0.0000 Costo_Mano_Obra,

    --dbo._Apu_Proyecto_Costo_Material (id) 
    0.0000 Costo_Material,

    --dbo._Apu_Proyecto_Costo_Transporte (id) 
    0.0000 Costo_Transporte,

    --dbo._Apu_Proyecto_Costo_Metro_Cuadrado (id) 
    0.0000 Costo_Metro_Cuadrado,

   dbo._Apu_Proyecto_Costo_Indirecto_Otros(Id) AS Costo_Indirecto_Otros,


    --dbo._apu_Proyecto_Porcentaje_Costo_Indirecto_Otros(Id) AS 
    dbo.__Suma_Dos_Decimales_2(Porcentaje_Costo_Indirecto,Porcentaje_Costo_Otros) Porcentaje_Costo_Indirecto_Otros, 

    --dbo._Apu_Proyecto_Indice_Sumatoria (Id) 
    0.000 Indice_Sumatoria,

    --dbo._Apu_Proyecto_Coeficiente_Sumatoria (Id) 
    0.000 Coeficiente_Sumatoria,

    --dbo._apu_proyecto_costo_mano_obra_cuadrilla (Id) 
    0.000 Cuadrilla_Sumatoria,

    --dbo._Apu_Proyecto_Cuadrilla_Coeficiente_Sumatoria (id) 
    0.000 Cuadrilla_Coeficiente_Sumatoria,

    --dbo._Apu_Proyecto_Transporte_Suma_Porcentaje (id) 
    0.0000 Suma_Porcentaje_Indice_Transporte,
 
    
    dbo.Dominio('APU_PROYECTO','ETAPA',Etapa,@p_ver_version_id) Etapa_Nombre,

    --dbo.estado ('APU_PROYECTO','ESTADO', Estado, @p_Ver_Version_Id ) 
    ' ' Estado_Nombre,
	' ' Cadena_Indice,
	' ' Cadena_Cuadrilla,

	dbo._Apu_Presupuesto_Estado(Id) Apu_Presupuesto_Estado,
    dbo.Estado ('APU_PRESUPUESTO','ESTADO', dbo._Apu_Presupuesto_Estado(Id), @p_ver_version_Id) Apu_Presupuesto_Estado_Nombre,
    dbo.Dominio('APU_PROYECTO','TIPO_CONTRATO',Tipo_Contrato,@p_ver_version_id) Tipo_Nombre

FROM 
(SELECT     
    Id,
    Codigo, 
    Codigo_Institucion,
    Nombre,
    Apu_Lugar_id, 
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
	
    ROW_NUMBER() OVER (ORDER BY   convert(numeric,Codigo) desc ) AS RowNumber 
FROM      Apu_Proyecto
Where Int_sucursal_Id = @p_int_sucursal_id 

AND ( convert(numeric,Codigo) between convert(numeric,@p_Codigo_Desde) and convert(numeric,@p_Codigo_Hasta))
and (@p_Estado ='%' OR  Estado like @p_Estado)
AND (@p_Nombre='%' OR Nombre like @p_Nombre)
and (Fecha_Creacion between @p_Fecha_Creacion_Desde and @p_Fecha_Creacion_Hasta)

and (@p_Coordinador_Per_Personal_Nombre='%' OR dbo._Per_Personal_Nombre(Coordinador_Per_Personal_Id) like @p_Coordinador_Per_Personal_Nombre )
and (@p_Tecnico_Per_Personal_Nombre='%' OR dbo._Per_Personal_Nombre(Tecnico_Per_Personal_Id) like @p_Tecnico_Per_Personal_Nombre)

and (@p_Apu_Lugar_Nombre='%' OR dbo._Apu_Lugar_Nombre(Apu_Lugar_Id) like @p_Apu_Lugar_Nombre)
and (@p_Apu_Provincia_Nombre='%' OR dbo._Apu_Provincia_Nombre(dbo._Apu_Lugar_Apu_Provincia_Id(Apu_Lugar_Id)) like @p_Apu_Provincia_Nombre)

and (@p_Apu_Presupuesto_Estado='%' OR 	dbo._Apu_Presupuesto_Estado(Id) like @p_Apu_Presupuesto_Estado)

) Apu_Proyecto
where   RowNumber > (@p_Numero_Registros* (@p_Pagina_Actual-1)) 
and RowNumber <= (@p_Numero_Registros * (@p_Pagina_Actual))
order by convert(numeric,Codigo) desc





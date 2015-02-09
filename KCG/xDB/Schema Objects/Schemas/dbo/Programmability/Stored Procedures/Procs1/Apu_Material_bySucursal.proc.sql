

CREATE PROCEDURE [dbo].[Apu_Material_bySucursal]
(
  @p_Ver_Version_id varchar(17),
  @p_Int_Sucursal_id varchar(17),
  @p_Numero_Registros int,
  @p_Pagina_Actual int,
  @p_Codigo_Desde varchar(200),
  @p_Codigo_Hasta varchar(200),
  @p_Nombre varchar(500),
  @p_Unidad varchar(200),
  @p_Costo_Total_Desde numeric(17, 4),
  @p_Costo_Total_Hasta numeric(17, 4),
  @p_Disponible varchar(3)

)
AS
	SET NOCOUNT ON;
if (@p_Codigo_Desde is null)
	set @p_Codigo_Desde='0';
if (@p_Codigo_Hasta is null)
	set @p_Codigo_Hasta='9999999999';


if ( @p_Nombre is null)
	set @p_Nombre='%';
if (@p_Unidad is null)
	set @p_Unidad='%'
if (@p_Disponible is null)
	set @p_Disponible ='%'

SELECT     
    Id,
    Codigo,
    Nombre,
    Unidad, 
    Costo_Parcial,
    Costo_Otros,
    Costo_Transporte,
    Disponible,
    Int_Sucursal_Id,
    Int_Moneda_Id, 
    Fecha_Creacion, 
    Creacion_Per_Personal_Id,
    Fecha_Update, 
    Update_Per_Personal_Id,
    Estado,

    '' --dbo._int_sucursal_codigo (Int_Sucursal_Id) 
    Int_Sucursal_Codigo,
    '' --dbo._int_sucursal_nombre (Int_Sucursal_Id) 
    Int_Sucursal_Nombre,

    '' --dbo._Int_Moneda_Codigo (Int_Moneda_Id) 
    Int_Moneda_Codigo,
    '' --dbo._Int_Moneda_Nombre (int_Moneda_Id) 
    Int_Moneda_Nombre,
    

    '' --dbo._int_sucursal_int_empresa_id (Int_Sucursal_Id) 
    Int_Empresa_Id,
    '' --dbo._int_empresa_codigo (dbo._int_sucursal_int_empresa_id (Int_Sucursal_Id)) 
    Int_Empresa_Codigo,
    ''--dbo._int_empresa_nombre (dbo._int_sucursal_int_empresa_id (Int_Sucursal_Id)) 
    Int_Empresa_Nombre,

    '' --dbo._per_personal_Codigo (Creacion_Per_Personal_Id) 
    Creacion_Per_Personal_Codigo,
    '' --dbo._per_personal_Nombre (Creacion_Per_Personal_Id) 
    Creacion_Per_Personal_Nombre,

    '' --dbo._per_personal_Codigo (Update_Per_Personal_Id) 
    Update_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Update_Per_Personal_Id) Update_Per_Personal_Nombre,
    
    dbo._Apu_Material_Costo_Total (id) Costo_Total,
    dbo._Apu_Material_Costo_Total_Costo_Transporte (id) Costo_Total_Costo_Transporte,
        
    ''
    --dbo._int_moneda_simbolo (Int_Moneda_Id) 
    Int_Moneda_Simbolo, 
    
    '' --dbo.dominio('APU_MATERIAL','DISPONIBLE',disponible,@p_ver_version_id) 
    Disponible_Nombre,
    '' --dbo.estado ('APU_MATERIAL','ESTADO', estado, @p_ver_version_id) 
    Estado_nombre
FROM (
SELECT     
    Id,
    Codigo,
    Nombre,
    Unidad, 
    Costo_Parcial,
    Costo_Otros,
    Costo_Transporte,
    Disponible,
    Int_Sucursal_Id,
    Int_Moneda_Id, 
    Fecha_Creacion, 
    Creacion_Per_Personal_Id,
    Fecha_Update, 
    Update_Per_Personal_Id,
    Estado,
    ROW_NUMBER() OVER (ORDER BY convert(numeric,Codigo)) AS RowNumber 
from Apu_Material
where Int_Sucursal_Id= @p_Int_Sucursal_id 
AND ( convert(numeric,Codigo) between convert(numeric,@p_Codigo_Desde) and convert(numeric,@p_Codigo_Hasta))
AND (@p_Nombre ='%' OR Nombre like @p_Nombre)
and (@p_Unidad ='%' OR Unidad like @p_Unidad )
AND ( convert(numeric,dbo._Apu_Material_Costo_Total (id)) between convert(numeric,@p_Costo_Total_Desde) and convert(numeric,@p_Costo_Total_Hasta))
and (@p_Disponible='%' OR Disponible like @p_Disponible)
) Apu_Material
where  RowNumber > (@p_Numero_Registros* (@p_Pagina_Actual-1)) 
and RowNumber <= (@p_Numero_Registros * (@p_Pagina_Actual))









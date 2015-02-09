CREATE PROCEDURE [dbo].[Apu_Equipo_ByCodigo]
(
   @p_Ver_Version_Id VARCHAR(17),
   @p_Codigo varchar (200)
)
AS
	SET NOCOUNT ON;
SELECT   
    Id,
    Codigo,
    Nombre,
    Disponible, 
    Costo_Combustible,
    Costo_Repuesto,
    Costo_Mantenimiento,
    Costo_Alquiler,
    Costo_Otros,
    Int_Sucursal_Id, 
    Int_Moneda_Id,
    Fecha_Creacion,
    Creacion_Per_Personal_Id,
    Fecha_Update,
    Update_Per_Personal_Id,
    Estado,

    dbo._Int_Sucursal_Codigo (Int_Sucursal_Id) Int_Sucursal_Codigo,
    dbo._Int_Sucursal_Nombre (Int_Sucursal_Id) Int_Sucursal_Nombre,

    dbo._Int_Sucursal_Int_Empresa_Id (Int_Sucursal_Id) Int_Empresa_Id,
    dbo._Int_Empresa_Codigo (dbo._Int_Sucursal_Int_Empresa_Id (Int_Sucursal_Id)) Int_Empresa_Codigo,
    dbo._Int_Empresa_Nombre (dbo._Int_Sucursal_Int_Empresa_Id (Int_Sucursal_Id)) Int_Empresa_Nombre,

    dbo._Int_Moneda_Codigo (Int_Moneda_Id) Int_Moneda_Codigo,
    dbo._Int_Moneda_Nombre (int_Moneda_Id) Int_Moneda_Nombre,
    dbo._Int_Moneda_Simbolo (int_Moneda_Id) Int_Moneda_Simbolo,

    dbo._Per_Personal_Codigo (Creacion_Per_Personal_Id) Creacion_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Creacion_Per_Personal_Id) Creacion_Per_Personal_Nombre,
    
    dbo._Apu_Equipo_Costo_Total (id) Costo_Total,
    dbo._Apu_Equipo_Costo_Hora (id) Costo_Hora, 

    dbo._Per_Personal_Codigo (Update_Per_Personal_Id) Update_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Update_Per_Personal_Id) Update_Per_Personal_Nombre,
     
    dbo.Dominio('APU_EQUIPO','DISPONIBLE', Disponible, @p_ver_version_id) Disponible_Nombre,
    dbo.Estado ('APU_EQUIPO', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre

fROM         Apu_Equipo
Where  Codigo = @p_Codigo






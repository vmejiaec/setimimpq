CREATE PROCEDURE [dbo].[Apu_Material_ById]
(
  @p_Ver_Version_id varchar(17),
  @p_Id varchar (17)
)
AS
	SET NOCOUNT ON;
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

    dbo._Int_Sucursal_Codigo (Int_Sucursal_Id) Int_Sucursal_Codigo,
    dbo._Int_Sucursal_Nombre (Int_Sucursal_Id) Int_Sucursal_Nombre,

    dbo._Int_Moneda_Codigo (Int_Moneda_Id) Int_Moneda_Codigo,
    dbo._Int_Moneda_Nombre (int_Moneda_Id) Int_Moneda_Nombre,
    

    dbo._Int_Sucursal_Int_Empresa_Id (Int_Sucursal_Id) Int_Empresa_Id,
    dbo._Int_Empresa_Codigo (dbo._Int_Sucursal_Int_Empresa_Id (Int_Sucursal_Id)) Int_Empresa_Codigo,
    dbo._Int_Empresa_Nombre (dbo._Int_Sucursal_Int_Empresa_Id (Int_Sucursal_Id)) Int_Empresa_Nombre,

    dbo._Per_Personal_Codigo (Creacion_Per_Personal_Id) Creacion_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Creacion_Per_Personal_Id) Creacion_Per_Personal_Nombre,

    dbo._Per_Personal_Codigo (Update_Per_Personal_Id) Update_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Update_Per_Personal_Id) Update_Per_Personal_Nombre,
    
    dbo._Apu_Material_Costo_Total (id) Costo_Total,
    dbo._Apu_Material_Costo_Total_Costo_Transporte (id) Costo_Total_Costo_Transporte,
        
    dbo._Int_Moneda_Simbolo (Int_Moneda_Id) Int_Moneda_Simbolo, 
    
    dbo.Dominio('APU_MATERIAL','DISPONIBLE',disponible,@p_ver_version_id) Disponible_Nombre,
    dbo.Estado ('APU_MATERIAL','ESTADO', estado, @p_ver_version_id) estado_nombre
FROM         Apu_Material
Where  Id = @p_Id



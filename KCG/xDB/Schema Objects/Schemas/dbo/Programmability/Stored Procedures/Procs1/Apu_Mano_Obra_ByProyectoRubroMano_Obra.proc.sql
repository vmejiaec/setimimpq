CREATE PROCEDURE [dbo].[Apu_Mano_Obra_ByProyectoRubroMano_Obra]
(
  @p_Ver_Version_Id VARCHAR(17),
  @p_Apu_Proyecto_Rubro_id varchar(17),
  @p_Apu_Mano_Obra_Id varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT   
    Id,
    Codigo,
    Nombre,
    Disponible, 
    Costo_Diario,
    Apu_Categoria_Id,
    Int_Sucursal_Id, 
    Int_Moneda_Id,
    Fecha_Creacion,
    Creacion_Per_Personal_Id,
    Fecha_Update,
    Update_Per_Personal_Id,
    Estado,
    
    dbo._Apu_Categoria_Codigo(Apu_Categoria_Id) Apu_Categoria_Codigo,
    dbo._Apu_Categoria_Nombre(Apu_Categoria_Id) Apu_Categoria_Nombre, 
     
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
    
    dbo._Per_Personal_Codigo (Update_Per_Personal_Id) Update_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Update_Per_Personal_Id) Update_Per_Personal_Nombre,
    
    dbo._Apu_Mano_Obra_Costo_Hora (id) Costo_Hora,
    
    dbo.Dominio('APU_MANO_OBRA','DISPONIBLE', Disponible, @p_ver_version_id) Disponible_Nombre,
    dbo.Estado ('APU_MANO_OBRA', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre
FROM         Apu_Mano_Obra
WHERE Id = @p_Apu_Mano_Obra_id
and id not in
(Select apu_mano_obra_id
 from apu_proyecto_mano_obra
 where apu_proyecto_id = dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (@p_apu_proyecto_rubro_Id) 
 and apu_proyecto_mano_obra.apu_mano_obra_id = @p_apu_mano_obra_id)






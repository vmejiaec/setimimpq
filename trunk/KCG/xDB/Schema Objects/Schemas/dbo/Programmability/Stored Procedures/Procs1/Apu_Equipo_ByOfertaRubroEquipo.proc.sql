CREATE PROCEDURE [dbo].[Apu_Equipo_ByOfertaRubroEquipo]
(
  @p_Ver_Version_Id VARCHAR(17),
  @p_Apu_Oferta_Rubro_id varchar(17),
  @p_Apu_Equipo_Id varchar(17)
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
    
    dbo._Per_Personal_Codigo (Update_Per_Personal_Id) Update_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Update_Per_Personal_Id) Update_Per_Personal_Nombre,
     
    dbo.Dominio('APU_MANO_OBRA','DISPONIBLE', Disponible, @p_ver_version_id) Disponible_Nombre,
    dbo.Estado ('APU_MANO_OBRA', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre,

    dbo._Apu_Equipo_Costo_Total (id)Costo_Total,
    dbo._Apu_Equipo_Costo_Hora (id) Costo_Hora
FROM  Apu_Equipo
WHERE Id = @p_Apu_equipo_id
and id not in
(Select apu_equipo_id
from apu_oferta_equipo
where apu_oferta_id = dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (@p_apu_oferta_rubro_Id) 
and apu_oferta_equipo.apu_equipo_id = @p_apu_equipo_id)










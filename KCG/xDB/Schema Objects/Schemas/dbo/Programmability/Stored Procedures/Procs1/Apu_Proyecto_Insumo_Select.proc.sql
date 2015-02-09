CREATE PROCEDURE [dbo].[Apu_Proyecto_Insumo_Select]
(
   @p_Ver_Version_Id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT     
    Id,
    Codigo, 
    Apu_Proyecto_Id,
    Apu_Material_Id Apu_Insumo_Id,
    'MAT' Tipo,
    dbo.Dominio ('APU_PROYECTO_INSUMO', 'TIPO', 'MAT', @p_Ver_Version_Id ) Tipo_Nombre,

    dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) Apu_Proyecto_Codigo,
    dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id) Apu_Proyecto_Nombre,
    dbo._Apu_Proyecto_Etapa (Apu_Proyecto_Id) Apu_Proyecto_Etapa,

	dbo._Apu_Material_Codigo (Apu_Material_Id) Apu_Insumo_Codigo,
	dbo._Apu_Material_Nombre (Apu_Material_Id) Apu_Insumo_Nombre,

    dbo._Apu_Material_Costo_Total (Apu_Material_Id) Costo_Parametros,
    dbo._Apu_Proyecto_Material_Costo_Total (Id) Costo_Proyecto,

    dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_Id) Int_Sucursal_Id
    
FROM         Apu_Proyecto_Material
UNION
SELECT     
    Id,
    Codigo, 
    Apu_Proyecto_Id,
    Apu_Material_Id Apu_Insumo_Id,
    'TRA' Tipo,
    dbo.Dominio ('APU_PROYECTO_INSUMO', 'TIPO', 'TRA', @p_Ver_Version_Id ) Tipo_Nombre,

    dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) Apu_Proyecto_Codigo,
    dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id) Apu_Proyecto_Nombre,
    dbo._Apu_Proyecto_Etapa (Apu_Proyecto_Id) Apu_Proyecto_Etapa,

	dbo._Apu_Material_Codigo (Apu_Material_Id) Apu_Insumo_Codigo,
	dbo._Apu_Material_Nombre (Apu_Material_Id) Apu_Insumo_Nombre,

    dbo._Apu_Transporte_Costo_Total (Apu_Material_Id) Costo_Parametros,
    dbo._Apu_Proyecto_Material_Costo_Transporte (Id) Costo_Proyecto,

    dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_Id) Int_Sucursal_Id
    
FROM         Apu_Proyecto_Material
UNION
SELECT     
    Id,
    Codigo, 
    Apu_Proyecto_Id,
    Apu_Mano_Obra_Id Apu_Insumo_Id,
    'MAN' Tipo,
    dbo.Dominio ('APU_PROYECTO_INSUMO', 'TIPO', 'MAN', @p_Ver_Version_Id ) Tipo_Nombre,

    dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) Apu_Proyecto_Codigo,
    dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id) Apu_Proyecto_Nombre,
    dbo._Apu_Proyecto_Etapa (Apu_Proyecto_Id) Apu_Proyecto_Etapa,
	dbo._Apu_Mano_Obra_Codigo (Apu_Mano_Obra_Id) Apu_Insumo_Codigo,
	dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) Apu_Insumo_Nombre,

    dbo._Apu_Mano_Obra_Costo_Hora (Apu_Mano_Obra_Id) Costo_Parametros,
    dbo._Apu_Proyecto_Mano_Obra_Costo_Hora (Id) Costo_Proyecto,

    dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_Id) Int_Sucursal_Id

FROM         Apu_Proyecto_Mano_Obra
UNION
SELECT     
    Id,
    Codigo, 
    Apu_Proyecto_Id,
    Apu_Equipo_Id Apu_Insumo_Id,
    'EQU' Tipo,
    dbo.Dominio ('APU_PROYECTO_INSUMO', 'TIPO', 'EQU', @p_Ver_Version_Id ) Tipo_Nombre,

    dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) Apu_Proyecto_Codigo,
    dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id) Apu_Proyecto_Nombre,
    dbo._Apu_Proyecto_Etapa (Apu_Proyecto_Id) Apu_Proyecto_Etapa,
	dbo._Apu_Equipo_Codigo (Apu_Equipo_Id) Apu_Insumo_Codigo,
	dbo._Apu_Equipo_Nombre (Apu_Equipo_Id) Apu_Insumo_Nombre,

    dbo._Apu_Equipo_Costo_Hora   (Apu_Equipo_Id) Costo_Parametros,
    dbo._Apu_Proyecto_Equipo_Costo_Hora (Id) Costo_Proyecto,

    dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_Id) Int_Sucursal_Id

FROM         Apu_Proyecto_Equipo
















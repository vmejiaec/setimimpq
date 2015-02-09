

CREATE PROCEDURE [dbo].[Apu_Proyecto_Rubro_Insumo_ByProyecto]
(
   @p_Ver_Version_Id varchar (17),
   @p_Apu_proyecto_id varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT     
    'MAT' Tipo,
    dbo.Dominio ('APU_PROYECTO_RUBRO_INSUMO', 'TIPO', 'MAT', @p_Ver_Version_Id ) Tipo_Nombre,

    Apu_Material_Id Apu_Insumo_Id,
    
    dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id) Apu_Proyecto_Id,
    dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Codigo,
    dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Nombre,
    dbo._Apu_Proyecto_Etapa  (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Etapa,

    dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id) Apu_Rubro_Id,
    dbo._Apu_Rubro_Codigo ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Codigo,
    dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Nombre,
	dbo._Apu_Rubro_Unidad ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Unidad,

    dbo._Apu_Material_Codigo (Apu_Material_Id) Apu_Insumo_Codigo,
    dbo._Apu_Material_Nombre (Apu_Material_Id) Apu_Insumo_Nombre,

    dbo._Apu_Proyecto_Rubro_Material_Costo_Diario (Id) Costo_Insumo,
    dbo._Apu_Proyecto_Rubro_Material_Cantidad (Id) Cantidad_Insumo,

    dbo._Apu_Proyecto_Rubro_Material_Costo_Diario_X_Cantidad (Id,@p_Apu_proyecto_id)    Costo_x_Cantidad,

    dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) Int_Sucursal_Id,
    
    dbo._Apu_Proyecto_Rubro_Cantidad (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Cantidad,
    dbo._Apu_Proyecto_Rubro_Costo_Total (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Costo_Directo,

	dbo._Apu_Proyecto_Rubro_Costo_Total_Indirecto (Apu_Proyecto_Rubro_Id) - dbo._Apu_Proyecto_Rubro_Costo_Total (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Costo_Indirecto,

    dbo._Apu_Proyecto_Rubro_Costo_Total_Indirecto (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Costo,

	dbo._Apu_Proyecto_Rubro_Costo_Uni_Sin_Ind (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Costo_Unitario,

	Apu_Proyecto_Rubro_Id

FROM         Apu_Proyecto_Rubro_Material
WHERE dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id) = @p_apu_proyecto_id
UNION
SELECT     
    'TRA' Tipo,
    dbo.Dominio ('APU_PROYECTO_RUBRO_INSUMO', 'TIPO', 'TRA', @p_Ver_Version_Id ) Tipo_Nombre,

    Apu_Material_Id Apu_Insumo_Id,
    
    dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id) Apu_Proyecto_Id,
    dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Codigo,
    dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Nombre,
    dbo._Apu_Proyecto_Etapa  (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Etapa,

    dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id) Apu_Rubro_Id,
    dbo._Apu_Rubro_Codigo ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Codigo,
    dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Nombre,
	dbo._Apu_Rubro_Unidad ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Unidad,

    dbo._Apu_Material_Codigo (Apu_Material_Id) Apu_Insumo_Codigo,
    dbo._Apu_Material_Nombre (Apu_Material_Id) Apu_Insumo_Nombre,

    dbo._Apu_Proyecto_Rubro_Material_Transporte_Costo_Diario (Id) 
    Costo_Insumo,
    dbo._Apu_Proyecto_Rubro_Material_Cantidad (Id) 
    Cantidad_Insumo,
    dbo._Apu_Proyecto_Rubro_Material_Transporte_Costo_Diario_X_Cantidad (Id, @p_Apu_proyecto_id) 
    Costo_x_Cantidad,

    dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) Int_Sucursal_Id,

    dbo. _Apu_Proyecto_Rubro_Cantidad (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Cantidad,
    dbo._Apu_Proyecto_Rubro_Costo_Total (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Costo_Directo,

	dbo._Apu_Proyecto_Rubro_Costo_Total_Indirecto (Apu_Proyecto_Rubro_Id)- dbo._Apu_Proyecto_Rubro_Costo_Total (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Costo_Indirecto,
    dbo._Apu_Proyecto_Rubro_Costo_Total_Indirecto (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Costo,

	dbo._Apu_Proyecto_Rubro_Costo_Uni_Sin_Ind (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Costo_Unitario  ,
	Apu_Proyecto_Rubro_Id

FROM         Apu_Proyecto_Rubro_Material
WHERE dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id) = @p_apu_proyecto_id
UNION
SELECT     
    'MAN' Tipo,
    dbo.Dominio ('APU_PROYECTO_RUBRO_INSUMO', 'TIPO', 'MAN', @p_Ver_Version_Id ) Tipo_Nombre,

    Apu_Mano_Obra_Id Apu_Insumo_Id,
    
    dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id) Apu_Proyecto_Id,
    dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Codigo,
    dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Nombre,
    dbo._Apu_Proyecto_Etapa  (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Etapa,

    dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id) Apu_Rubro_Id,
    dbo._Apu_Rubro_Codigo ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Codigo,
    dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Nombre,
	dbo._Apu_Rubro_Unidad ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Unidad,

    dbo._Apu_Mano_Obra_Codigo (Apu_Mano_Obra_Id) Apu_Insumo_Codigo,
    dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) Apu_Insumo_Nombre,

    dbo._Apu_Proyecto_Rubro_Mano_Obra_Costo_Hora (Id)     Costo_Insumo,
    dbo._Apu_Proyecto_Rubro_Mano_Obra_Cantidad (Id)     Cantidad_Insumo,
	dbo._Apu_Proyecto_Rubro_Mano_Obra_Costo_X_Rendimiento (Id, @p_Apu_proyecto_id) Costo_x_Cantidad,
    --dbo._Apu_Proyecto_Rubro_Mano_Obra_Costo_Hora_X_Cantidad (Id)     

    dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) Int_Sucursal_Id,

    dbo._Apu_Proyecto_Rubro_Cantidad (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Cantidad,
    dbo._Apu_Proyecto_Rubro_Costo_Total (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Costo_Directo,
    dbo._Apu_Proyecto_Rubro_Costo_Total_Indirecto (Apu_Proyecto_Rubro_Id)-dbo._Apu_Proyecto_Rubro_Costo_Total (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Costo_Indirecto,
    
    dbo._Apu_Proyecto_Rubro_Costo_Total_Indirecto (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Costo ,  

	dbo._Apu_Proyecto_Rubro_Costo_Uni_Sin_Ind   (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Costo_Unitario,
	Apu_Proyecto_Rubro_Id

FROM         Apu_Proyecto_Rubro_Mano_Obra
WHERE dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id) = @p_apu_proyecto_id
UNION
SELECT     
    'EQU' Tipo,
    dbo.Dominio ('APU_PROYECTO_RUBRO_INSUMO', 'TIPO', 'EQU', @p_Ver_Version_Id ) Tipo_Nombre,

    Apu_Equipo_Id Apu_Insumo_Id,
    
    dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id) Apu_Proyecto_Id,
    dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Codigo,
    dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Nombre,
    dbo._Apu_Proyecto_Etapa  (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Etapa,

    dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id) Apu_Rubro_Id,
    dbo._Apu_Rubro_Codigo ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Codigo,
    dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Nombre,
	dbo._Apu_Rubro_Unidad ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Unidad,

    dbo._Apu_Equipo_Codigo (Apu_Equipo_Id) Apu_Insumo_Codigo,
    dbo._Apu_Equipo_Nombre (Apu_Equipo_Id) Apu_Insumo_Nombre,

    dbo._Apu_Proyecto_Rubro_Equipo_Costo_Hora (Id)     Costo_Insumo,
    dbo._Apu_Proyecto_Rubro_Equipo_Cantidad (Id)     Cantidad_Insumo,
    --dbo._Apu_Proyecto_Rubro_Equipo_Costo_Hora_X_Cantidad (Id)     Costo_x_Cantidad,
	dbo._Apu_Proyecto_Rubro_Equipo_Costo_X_Rendimiento (Id, @p_Apu_proyecto_id)     Costo_x_Cantidad,
    dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) Int_Sucursal_Id,

    dbo._Apu_Proyecto_Rubro_Cantidad (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Cantidad,
    dbo._Apu_Proyecto_Rubro_Costo_Total (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Costo_Directo,

    dbo._Apu_Proyecto_Rubro_Costo_Total_Indirecto (Apu_Proyecto_Rubro_Id) -dbo._Apu_Proyecto_Rubro_Costo_Total (Apu_Proyecto_Rubro_Id)Apu_Proyecto_Rubro_Costo_Indirecto,
    dbo._Apu_Proyecto_Rubro_Costo_Total_Indirecto (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Costo,

	dbo._Apu_Proyecto_Rubro_Costo_Uni_Sin_Ind   (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Costo_Unitario  ,
	Apu_Proyecto_Rubro_Id

FROM         Apu_Proyecto_Rubro_Equipo
WHERE dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id) = @p_apu_proyecto_id

























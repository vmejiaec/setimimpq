CREATE PROCEDURE [dbo].[Apu_Oferta_Rubro_Insumo_ByOferta]
(
   @p_Ver_Version_Id varchar (17),
   @p_Apu_Oferta_Id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT     
    'MAT' Tipo,

    dbo.Dominio ('APU_OFERTA_RUBRO_INSUMO', 'TIPO', 'MAT', @p_Ver_Version_Id ) Tipo_Nombre,

    Apu_Material_Id Apu_Insumo_Id,
    
    dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id) Apu_Oferta_Id,
    dbo._Apu_Oferta_Codigo (dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id)) Apu_Oferta_Codigo,
    dbo._Apu_Oferta_Nombre (dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id)) Apu_Oferta_Nombre,
    dbo._Apu_Oferta_Etapa  (dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id)) Apu_Oferta_Etapa,

    dbo._Apu_Oferta_Rubro_Apu_Rubro_Id (Apu_Oferta_Rubro_Id) Apu_Rubro_Id,
    dbo._Apu_Rubro_Codigo ( dbo._Apu_Oferta_Rubro_Apu_Rubro_Id (Apu_Oferta_Rubro_Id)) Apu_Rubro_Codigo,
    dbo._Apu_Rubro_Nombre ( dbo._Apu_Oferta_Rubro_Apu_Rubro_Id (Apu_Oferta_Rubro_Id)) Apu_Rubro_Nombre,
	dbo._Apu_Rubro_Unidad ( dbo._Apu_Oferta_Rubro_Apu_Rubro_Id (Apu_Oferta_Rubro_Id)) Apu_Rubro_Unidad,

    dbo._Apu_Material_Codigo (Apu_Material_Id) Apu_Insumo_Codigo,
    dbo._Apu_Material_Nombre (Apu_Material_Id) Apu_Insumo_Nombre,

    dbo._Apu_Oferta_Rubro_Material_Costo (Id) Costo_Insumo,
    dbo._Apu_Oferta_Rubro_Costo_Uni_Sin_Ind (Apu_Oferta_Rubro_Id) Costo_x_Cantidad,

    dbo._Apu_Oferta_Rubro_Int_Sucursal_Id (Apu_Oferta_Rubro_Id) Int_Sucursal_Id,
    
    dbo._Apu_Oferta_Rubro_Cantidad (Apu_Oferta_Rubro_Id) Apu_Oferta_Rubro_Cantidad,
    dbo._Apu_Oferta_Rubro_Costo_Total (Apu_Oferta_Rubro_Id) Apu_Oferta_Rubro_Costo_Directo,

    dbo._Apu_Oferta_Rubro_Costo_Total_Indirecto_2 (Apu_Oferta_Rubro_Id) - dbo._Apu_Oferta_Rubro_Costo_Total (Apu_Oferta_Rubro_Id)Apu_Oferta_Rubro_Costo_Indirecto,
    dbo._Apu_Oferta_Rubro_Costo_Total_Indirecto_2 (Apu_Oferta_Rubro_Id) Apu_Oferta_Rubro_Costo
    

FROM         Apu_Oferta_Rubro_Material
WHERE     dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id)= @p_Apu_Oferta_Id
UNION
SELECT     
    'TRA' Tipo,
    dbo.Dominio ('APU_OFERTA_RUBRO_INSUMO', 'TIPO', 'TRA', @p_Ver_Version_Id ) Tipo_Nombre,

    Apu_Material_Id Apu_Insumo_Id,
    
    dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id) Apu_Oferta_Id,
    dbo._Apu_Oferta_Codigo (dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id)) Apu_Oferta_Codigo,
    dbo._Apu_Oferta_Nombre (dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id)) Apu_Oferta_Nombre,
    dbo._Apu_Oferta_Etapa  (dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id)) Apu_Oferta_Etapa,

    dbo._Apu_Oferta_Rubro_Apu_Rubro_Id (Apu_Oferta_Rubro_Id) Apu_Rubro_Id,
    dbo._Apu_Rubro_Codigo ( dbo._Apu_Oferta_Rubro_Apu_Rubro_Id (Apu_Oferta_Rubro_Id)) Apu_Rubro_Codigo,
    dbo._Apu_Rubro_Nombre ( dbo._Apu_Oferta_Rubro_Apu_Rubro_Id (Apu_Oferta_Rubro_Id)) Apu_Rubro_Nombre,
	dbo._Apu_Rubro_Unidad ( dbo._Apu_Oferta_Rubro_Apu_Rubro_Id (Apu_Oferta_Rubro_Id)) Apu_Rubro_Unidad,

    dbo._Apu_Material_Codigo (Apu_Material_Id) Apu_Insumo_Codigo,
    dbo._Apu_Material_Nombre (Apu_Material_Id) Apu_Insumo_Nombre,

    dbo._Apu_Oferta_Rubro_Transporte_Costo (Id) Costo_Insumo,
	dbo._Apu_Oferta_Rubro_Costo_Uni_Sin_Ind (Apu_Oferta_Rubro_Id) Costo_x_Cantidad,

    dbo._Apu_Oferta_Rubro_Int_Sucursal_Id (Apu_Oferta_Rubro_Id) Int_Sucursal_Id,

    dbo._Apu_Oferta_Rubro_Cantidad (Apu_Oferta_Rubro_Id) Apu_Oferta_Rubro_Cantidad,
    dbo._Apu_Oferta_Rubro_Costo_Total (Apu_Oferta_Rubro_Id) Apu_Oferta_Rubro_Costo_Directo,

	dbo._Apu_Oferta_Rubro_Costo_Total_Indirecto_2 (Apu_Oferta_Rubro_Id) - dbo._Apu_Oferta_Rubro_Costo_Total (Apu_Oferta_Rubro_Id)Apu_Oferta_Rubro_Costo_Indirecto,
    dbo._Apu_Oferta_Rubro_Costo_Total_Indirecto_2 (Apu_Oferta_Rubro_Id) Apu_Oferta_Rubro_Costo   


FROM         Apu_Oferta_Rubro_Material
WHERE     dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id)= @p_Apu_Oferta_Id
UNION
SELECT     
    'MAN' Tipo,
    dbo.Dominio ('APU_OFERTA_RUBRO_INSUMO', 'TIPO', 'MAN', @p_Ver_Version_Id ) Tipo_Nombre,

    Apu_Mano_Obra_Id Apu_Insumo_Id,
    
    dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id) Apu_Oferta_Id,
    dbo._Apu_Oferta_Codigo (dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id)) Apu_Oferta_Codigo,
    dbo._Apu_Oferta_Nombre (dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id)) Apu_Oferta_Nombre,
    dbo._Apu_Oferta_Etapa  (dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id)) Apu_Oferta_Etapa,

    dbo._Apu_Oferta_Rubro_Apu_Rubro_Id (Apu_Oferta_Rubro_Id) Apu_Rubro_Id,
    dbo._Apu_Rubro_Codigo ( dbo._Apu_Oferta_Rubro_Apu_Rubro_Id (Apu_Oferta_Rubro_Id)) Apu_Rubro_Codigo,
    dbo._Apu_Rubro_Nombre ( dbo._Apu_Oferta_Rubro_Apu_Rubro_Id (Apu_Oferta_Rubro_Id)) Apu_Rubro_Nombre,
	dbo._Apu_Rubro_Unidad ( dbo._Apu_Oferta_Rubro_Apu_Rubro_Id (Apu_Oferta_Rubro_Id)) Apu_Rubro_Unidad,

    dbo._Apu_Mano_Obra_Codigo (Apu_Mano_Obra_Id) Apu_Insumo_Codigo,
    dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) Apu_Insumo_Nombre,

    dbo._Apu_Oferta_Rubro_Mano_Obra_Costo (Id) Costo_Insumo,
    dbo._Apu_Oferta_Rubro_Costo_Uni_Sin_Ind (Apu_Oferta_Rubro_Id) Costo_x_Cantidad,

    dbo._Apu_Oferta_Rubro_Int_Sucursal_Id (Apu_Oferta_Rubro_Id) Int_Sucursal_Id,

    dbo._Apu_Oferta_Rubro_Cantidad (Apu_Oferta_Rubro_Id) Apu_Oferta_Rubro_Cantidad,
    dbo._Apu_Oferta_Rubro_Costo_Total (Apu_Oferta_Rubro_Id) Apu_Oferta_Rubro_Costo_Directo,
   --Comentado JPU para cuadre
--  dbo._Apu_Oferta_Rubro_Costo_Indirecto (Apu_Oferta_Rubro_Id) Apu_Oferta_Rubro_Costo_Indirecto,
	dbo._Apu_Oferta_Rubro_Costo_Total_Indirecto_2 (Apu_Oferta_Rubro_Id) - dbo._Apu_Oferta_Rubro_Costo_Total (Apu_Oferta_Rubro_Id)Apu_Oferta_Rubro_Costo_Indirecto,
    dbo._Apu_Oferta_Rubro_Costo_Total_Indirecto_2 (Apu_Oferta_Rubro_Id) Apu_Oferta_Rubro_Costo   


FROM         Apu_Oferta_Rubro_Mano_Obra
WHERE     dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id)= @p_Apu_Oferta_Id
UNION
SELECT     
    'EQU' Tipo,
    dbo.Dominio ('APU_OFERTA_RUBRO_INSUMO', 'TIPO', 'EQU', @p_Ver_Version_Id ) Tipo_Nombre,

    Apu_Equipo_Id Apu_Insumo_Id,
    
    dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id) Apu_Oferta_Id,
    dbo._Apu_Oferta_Codigo (dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id)) Apu_Oferta_Codigo,
    dbo._Apu_Oferta_Nombre (dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id)) Apu_Oferta_Nombre,
    dbo._Apu_Oferta_Etapa  (dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id)) Apu_Oferta_Etapa,

    dbo._Apu_Oferta_Rubro_Apu_Rubro_Id (Apu_Oferta_Rubro_Id) Apu_Rubro_Id,
    dbo._Apu_Rubro_Codigo ( dbo._Apu_Oferta_Rubro_Apu_Rubro_Id (Apu_Oferta_Rubro_Id)) Apu_Rubro_Codigo,
    dbo._Apu_Rubro_Nombre ( dbo._Apu_Oferta_Rubro_Apu_Rubro_Id (Apu_Oferta_Rubro_Id)) Apu_Rubro_Nombre,
	dbo._Apu_Rubro_Unidad ( dbo._Apu_Oferta_Rubro_Apu_Rubro_Id (Apu_Oferta_Rubro_Id)) Apu_Rubro_Unidad,

    dbo._Apu_Equipo_Codigo (Apu_Equipo_Id) Apu_Insumo_Codigo,
    dbo._Apu_Equipo_Nombre (Apu_Equipo_Id) Apu_Insumo_Nombre,

    dbo._Apu_Oferta_Rubro_Equipo_Costo (Id) Costo_Insumo,
    dbo._Apu_Oferta_Rubro_Costo_Uni_Sin_Ind (Apu_Oferta_Rubro_Id) Costo_x_Cantidad,

    dbo._Apu_Oferta_Rubro_Int_Sucursal_Id (Apu_Oferta_Rubro_Id) Int_Sucursal_Id,

    dbo._Apu_Oferta_Rubro_Cantidad (Apu_Oferta_Rubro_Id) Apu_Oferta_Rubro_Cantidad,
    dbo._Apu_Oferta_Rubro_Costo_Total (Apu_Oferta_Rubro_Id) Apu_Oferta_Rubro_Costo_Directo,

	dbo._Apu_Oferta_Rubro_Costo_Total_Indirecto_2 (Apu_Oferta_Rubro_Id) - dbo._Apu_Oferta_Rubro_Costo_Total (Apu_Oferta_Rubro_Id)Apu_Oferta_Rubro_Costo_Indirecto,
    dbo._Apu_Oferta_Rubro_Costo_Total_Indirecto_2 (Apu_Oferta_Rubro_Id) Apu_Oferta_Rubro_Costo

FROM         Apu_Oferta_Rubro_Equipo
WHERE     dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id)= @p_Apu_Oferta_Id


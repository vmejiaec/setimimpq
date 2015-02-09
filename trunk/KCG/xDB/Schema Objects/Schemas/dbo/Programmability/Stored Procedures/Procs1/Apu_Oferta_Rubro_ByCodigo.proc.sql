CREATE PROCEDURE [dbo].[Apu_Oferta_Rubro_ByCodigo]
(
  @p_Ver_Version_Id VARCHAR(17),
   @p_Codigo varchar (200)
)
AS
	SET NOCOUNT ON;
SELECT   
    Id,
    Codigo,
    Apu_Oferta_Id,
    Apu_Rubro_Id,
    Cantidad,
    Estado,
   
    
    dbo._Apu_Oferta_Codigo(Apu_Oferta_Id) Apu_Oferta_Codigo,
    dbo._Apu_Oferta_Nombre(Apu_Oferta_Id) Apu_Oferta_Nombre,
 
    dbo._Apu_Rubro_Codigo(Apu_Rubro_Id) Apu_Rubro_Codigo,
    dbo._Apu_Rubro_Nombre(Apu_Rubro_Id) Apu_Rubro_Nombre,
    dbo._Apu_Rubro_Unidad (Apu_Rubro_Id) Apu_Rubro_Unidad,

    dbo.Estado ('APU_OFERTA_RUBRO', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre,

    dbo._Apu_Oferta_Rubro_Costo_Material        (id) Material_costo_total,
    dbo._Apu_Oferta_Rubro_Costo_Transporte      (id) Transporte_costo_total,
    dbo._Apu_Oferta_Rubro_Costo_Mano_Obra       (id) Mano_obra_costo_total,
    dbo._Apu_Oferta_Rubro_Costo_Equipo          (id) Equipo_costo_total,

    dbo._Apu_Oferta_Rubro_Costo_Unitario (id) Costo_Unitario,
    dbo._Apu_Oferta_Rubro_Costo_Total_Con_Ind (Id) Costo_Total,
    dbo._Apu_Oferta_Etapa (Apu_Oferta_id) Apu_Oferta_Etapa,

    dbo._Apu_Rubro_Costo_Total (Apu_Rubro_Id, dbo._Apu_Oferta_Int_Sucursal_Id (Apu_Oferta_Id)) Apu_rubro_Costo_Total,

    dbo._Apu_Oferta_Rubro_Material_Ultima_Fecha_Update    (id)  Material_ultima_fecha_update,
    dbo._Apu_Oferta_Rubro_Transporte_Ultima_Fecha_Update  (id)  Transporte_ultima_fecha_update,
    dbo._Apu_Oferta_Rubro_Mano_Obra_Ultima_Fecha_Update   (id)  Mano_obra_ultima_fecha_update,
    dbo._Apu_Oferta_Rubro_Equipo_Ultima_Fecha_Update      (id)  Equipo_ultima_fecha_update,

    dbo._Apu_Oferta_Rubro_Int_Moneda_Simbolo (id) int_moneda_simbolo,
    
    dbo._Apu_Oferta_Int_Sucursal_Id (Apu_Oferta_Id) Int_Sucursal_Id,

	dbo._Apu_Oferta_Rubro_Costo_Indirecto (Id) Costo_Indirecto,
	dbo._Apu_Oferta_Rubro_Costo_Total_Indirecto (Id) Costo_Directo_Indirecto,
	dbo._Apu_Oferta_Costo_Total (apu_oferta_Id) Apu_Oferta_Costo_Total

FROM         Apu_Oferta_Rubro
where Codigo = @p_Codigo















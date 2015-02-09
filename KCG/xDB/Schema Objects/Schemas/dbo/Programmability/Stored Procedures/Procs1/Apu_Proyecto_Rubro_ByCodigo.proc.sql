CREATE PROCEDURE [dbo].[Apu_Proyecto_Rubro_ByCodigo]
(
   @p_Ver_Version_Id VARCHAR(17),
   @p_Codigo varchar (200)
)
AS
	SET NOCOUNT ON;
SELECT   
    Id,
    Codigo,
    Apu_Proyecto_Id,
    Apu_Rubro_Id,
    Cantidad,
    Rendimiento_Mano_Obra,
    Rendimiento_Equipo,
	Apu_Subtitulo_id,
    Estado,
    
    Apu_Proyecto_Codigo,
    Apu_Proyecto_Nombre,
	Apu_Proyecto_Costo_Total,
 
    Apu_Subtitulo_Codigo,
    Apu_Subtitulo_Nombre,
   
    Apu_Rubro_Codigo,
    Apu_Rubro_Nombre,
    Apu_Rubro_Unidad,

    Apu_Titulo_id,
    Apu_Titulo_Codigo,
    Apu_Titulo_Nombre,

    dbo.Estado ('APU_PROYECTO_RUBRO', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre,

    Rendimiento_Mano_Obra_Hora,
    Rendimiento_Equipo_Hora,
    
    Material_costo_total,
    Transporte_costo_total,
    Mano_obra_costo_total,
    Equipo_costo_total,

    Costo_Unitario,
    Costo_Total,
    Apu_Proyecto_Etapa,

    Apu_rubro_Costo_Total,

    Material_ultima_fecha_update,
    Transporte_ultima_fecha_update,
    Mano_obra_ultima_fecha_update,
    Equipo_ultima_fecha_update,

    Int_moneda_simbolo,
    
    Int_Sucursal_Id,

    dbo._Apu_Proyecto_Rubro_Costo_Indirecto (Id)  Costo_Indirecto,
    dbo._Apu_Proyecto_Rubro_Costo_Total_Indirecto (Id) Costo_Directo_Indirecto

FROM   v_Apu_Proyecto_Rubro
Where  Codigo = @p_Codigo













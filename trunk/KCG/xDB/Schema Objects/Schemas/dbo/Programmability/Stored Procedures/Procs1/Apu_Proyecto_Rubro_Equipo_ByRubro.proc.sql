
CREATE PROCEDURE [dbo].[Apu_Proyecto_Rubro_Equipo_ByRubro]
(
   @p_Ver_Version_Id varchar (17),
   @p_Apu_Proyecto_Rubro_Id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT     
    Id,
    Codigo, 
    Apu_Proyecto_Rubro_Id,
    Apu_Equipo_Id,
    Cantidad, 
    Fecha_Update,
    Update_Per_Personal_Id,
    Fecha_Creacion,
    Creacion_Per_Personal_Id,
    Estado,

    dbo._Apu_Proyecto_Rubro_Codigo (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Codigo,
    
    dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Id,
    dbo._Apu_Proyecto_Codigo ( dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Codigo,
    dbo._Apu_Proyecto_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Nombre,
    dbo._Apu_Proyecto_Etapa ( dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Etapa,
    
    dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id) Apu_Rubro_Id,
    dbo._Apu_Rubro_Codigo ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Codigo,
    dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Nombre,
    dbo._Apu_Rubro_Unidad ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Unidad,

    dbo._Apu_Equipo_Codigo (Apu_Equipo_Id) Apu_Equipo_Codigo,
    dbo._Apu_Equipo_Nombre (Apu_Equipo_Id) Apu_Equipo_Nombre,
  
    dbo._Per_Personal_Codigo (Creacion_Per_Personal_Id) Creacion_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Creacion_Per_Personal_Id) Creacion_Per_Personal_Nombre,
    
    dbo._Per_Personal_Codigo (Update_Per_Personal_Id) Update_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Update_Per_Personal_Id) Update_Per_Personal_Nombre,
    
    dbo._Apu_Proyecto_Rubro_Equipo_Costo_Diario		     (id)    costo_diario,
    dbo._Apu_Proyecto_Rubro_Equipo_Costo_Hora			 (id)	 costo_hora,
    dbo._Apu_Proyecto_Rubro_Equipo_Costo_Hora_X_Cantidad (id)	 costo_hora_x_cantidad,
        dbo._Apu_Proyecto_Rubro_Equipo_Costo_X_Rendimiento	 (id, dbo._Apu_Proyecto_Rubro_Equipo_Apu_Proyecto_Id(Id))	 costo_x_rendimiento_hora,
    dbo._Apu_Proyecto_Rubro_Rendimiento_Equipo_Hora      (apu_proyecto_rubro_id)	rendimiento_equipo_hora,

    dbo._Apu_Proyecto_Rubro_Int_Moneda_Simbolo (apu_proyecto_rubro_id) int_moneda_simbolo,
              
    dbo.Estado ('APU_RUBRO_EQUIPO', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre

FROM  Apu_Proyecto_Rubro_Equipo
where Apu_Proyecto_Rubro_Id=@p_Apu_Proyecto_Rubro_Id

















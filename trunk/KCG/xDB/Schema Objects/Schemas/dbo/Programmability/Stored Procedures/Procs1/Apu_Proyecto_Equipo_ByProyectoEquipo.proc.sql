CREATE PROCEDURE [dbo].[Apu_Proyecto_Equipo_ByProyectoEquipo]
(
  @p_Ver_Version_Id VARCHAR(17),
  @p_Apu_Proyecto_Id varchar(17),
  @p_Apu_Equipo_Id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT   
    Id,
    Codigo,
    Costo_Combustible,
    Costo_Repuesto,
    Costo_Mantenimiento,
    Costo_Alquiler,
    Costo_Otros,
    Apu_Proyecto_Id,
    Apu_Equipo_Id,
    Estado,

    dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) Apu_Proyecto_Codigo,
    dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id) Apu_Proyecto_Nombre,
    dbo._Apu_Proyecto_Etapa (Apu_Proyecto_Id) Apu_Proyecto_Etapa,
    
    dbo._Apu_Equipo_Codigo (Apu_Equipo_Id) Apu_Equipo_Codigo,
    dbo._Apu_Equipo_Nombre (Apu_Equipo_Id) Apu_Equipo_Nombre,
    dbo._Apu_Equipo_Costo_Combustible (Apu_Equipo_Id) Apu_Equipo_Costo_Combustible,
    dbo._Apu_Equipo_Costo_Repuesto (Apu_Equipo_Id) Apu_Equipo_Costo_Repuesto,
    dbo._Apu_Equipo_Costo_Mantenimiento (Apu_Equipo_Id) Apu_Equipo_Costo_Mantenimiento,
    dbo._Apu_Equipo_Costo_Alquiler (Apu_Equipo_Id) Apu_Equipo_Costo_Alquiler,
    dbo._Apu_Equipo_Costo_Otros (Apu_Equipo_Id) Apu_Equipo_Costo_Otros,
 
    dbo._Apu_Proyecto_Int_Moneda_Simbolo (Apu_Proyecto_Id) Int_Moneda_Simbolo,

    dbo._Apu_Proyecto_Equipo_Cantidad_Equipo (apu_proyecto_id, apu_equipo_id) Cantidad_equipo, 
    dbo._Apu_Proyecto_Equipo_Cantidad_Equipo_X_Costo (Apu_Proyecto_Id, Apu_Equipo_id) Cantidad_equipo_X_Costo, 
    dbo._Apu_Proyecto_Equipo_Indice_Suma_Porcentaje (Id) Suma_porcentaje_Equipo,
    dbo._Apu_Proyecto_Equipo_Indice_Suma_Porcentaje (Id) Suma_porcentaje_Equipo_1,
    dbo.Estado ('APU_PROYECTO_EQUIPO', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre,

    dbo._Apu_Proyecto_Equipo_Costo_Total (id) Costo_Total,
    dbo._Apu_Proyecto_Equipo_Costo_Hora (id) Costo_Hora

FROM    Apu_Proyecto_Equipo
WHERE	Apu_Equipo_Id = @p_Apu_Equipo_Id
AND		Apu_Proyecto_Id = @p_apu_Proyecto_Id










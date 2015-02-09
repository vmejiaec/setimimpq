
CREATE PROCEDURE [dbo].[Apu_Proyecto_Equipo_Indice_ByCodigo]
(
  @p_Ver_Version_Id VARCHAR(17),
   @p_Codigo varchar (200)
)
AS
	SET NOCOUNT ON;
SELECT   
    Id,
    Codigo,
    Apu_Proyecto_Equipo_Id,
    Apu_Indice_Id,
    Porcentaje,
    Estado,

    dbo._Apu_Proyecto_Equipo_Codigo (Apu_Proyecto_Equipo_Id) Apu_Proyecto_Equipo_Codigo,

    dbo._Apu_Proyecto_Equipo_Apu_Proyecto_Id (Apu_Proyecto_Equipo_Id) Apu_Proyecto_Id,
    dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Equipo_Apu_Proyecto_Id (Apu_Proyecto_Equipo_Id)) Apu_Proyecto_Codigo,
    dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Equipo_Apu_Proyecto_Id (Apu_Proyecto_Equipo_Id)) Apu_Proyecto_Nombre,
    dbo._Apu_Proyecto_Etapa (dbo._Apu_Proyecto_Equipo_Apu_Proyecto_Id (Apu_Proyecto_Equipo_Id)) Apu_Proyecto_Etapa,

    dbo._Apu_Proyecto_Equipo_Apu_Equipo_Id (Apu_Proyecto_Equipo_Id) Apu_Equipo_Id,
    dbo._Apu_Equipo_Codigo (dbo._Apu_Proyecto_Equipo_Apu_Equipo_Id (Apu_Proyecto_Equipo_Id)) Apu_Equipo_Codigo,
    dbo._Apu_Equipo_Nombre (dbo._Apu_Proyecto_Equipo_Apu_Equipo_Id (Apu_Proyecto_Equipo_Id)) Apu_Equipo_Nombre,
    
    dbo._Apu_Indice_Codigo (Apu_Indice_Id) Apu_Indice_Codigo,
    dbo._Apu_Indice_Nombre (Apu_Indice_Id) Apu_Indice_Nombre,

    
    dbo._Apu_Proyecto_Equipo_Cantidad_Equipo_X_Costo (
            dbo._Apu_Proyecto_Equipo_Apu_Proyecto_Id (Apu_Proyecto_Equipo_Id),
            dbo._Apu_Proyecto_Equipo_Apu_Equipo_Id (apu_proyecto_equipo_id)
            )Apu_Proyecto_Equipo_Costo_Total,

    dbo._Apu_proyecto_Equipo_Indice_Costo_X_Porcentaje (Id) Costo_Indice,

    dbo._Apu_Proyecto_Int_Moneda_Simbolo (dbo._Apu_Proyecto_Equipo_Apu_Proyecto_Id (Apu_Proyecto_Equipo_Id)) Int_Moneda_Simbolo,

    dbo.Estado ('APU_PROYECTO_EQUIPO_INDICE', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre,
	
	dbo._Apu_Indice_Equipo_Porcentaje(Apu_Indice_Id) Apu_Indice_Equipo_Porcentaje

FROM         Apu_Proyecto_Equipo_Indice
Where  Codigo = @p_Codigo

















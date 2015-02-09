CREATE PROCEDURE [dbo].[Apu_Oferta_Equipo_Indice_Select]
(
  @p_Ver_Version_Id VARCHAR(17)
)
AS
	SET NOCOUNT ON;
SELECT   
    Id,
    Codigo,
    Apu_Oferta_Equipo_Id,
    Apu_Indice_Id,
    Porcentaje,
    Estado,

    dbo._Apu_Oferta_Equipo_Codigo (Apu_Oferta_Equipo_Id) Apu_Oferta_Equipo_Codigo,

    dbo._Apu_Oferta_Equipo_Apu_Oferta_Id (Apu_Oferta_Equipo_Id) Apu_Oferta_Id,
    dbo._Apu_Oferta_Codigo (dbo._Apu_Oferta_Equipo_Apu_Oferta_Id (Apu_Oferta_Equipo_Id)) Apu_Oferta_Codigo,
    dbo._Apu_Oferta_Nombre (dbo._Apu_Oferta_Equipo_Apu_Oferta_Id (Apu_Oferta_Equipo_Id)) Apu_Oferta_Nombre,
    dbo._Apu_Oferta_Etapa (dbo._Apu_Oferta_Equipo_Apu_Oferta_Id (Apu_Oferta_Equipo_Id)) Apu_Oferta_Etapa,

    dbo._Apu_Oferta_Equipo_Apu_Equipo_Id (Apu_Oferta_Equipo_Id) Apu_Equipo_Id,
    dbo._Apu_Equipo_Codigo (dbo._Apu_Oferta_Equipo_Apu_Equipo_Id (Apu_Oferta_Equipo_Id)) Apu_Equipo_Codigo,
    dbo._Apu_Equipo_Nombre (dbo._Apu_Oferta_Equipo_Apu_Equipo_Id (Apu_Oferta_Equipo_Id)) Apu_Equipo_Nombre,
    
    dbo._Apu_Indice_Codigo (Apu_Indice_Id) Apu_Indice_Codigo,
    dbo._Apu_Indice_Nombre (Apu_Indice_Id) Apu_Indice_Nombre,

    dbo._Apu_Oferta_Equipo_Cantidad_Equipo_X_Costo (Apu_Oferta_Equipo_Id) Apu_Oferta_Equipo_Costo_Total,
    dbo._Apu_Oferta_Equipo_Indice_Costo_X_Porcentaje (Id) Costo_Indice,

    dbo._Apu_Oferta_Int_Moneda_Simbolo (dbo._Apu_Oferta_Equipo_Apu_Oferta_Id (Apu_Oferta_Equipo_Id)) Int_Moneda_Simbolo,

    dbo.Estado ('APU_OFERTA_EQUIPO_INDICE', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre,
	
	dbo._Apu_Indice_Equipo_Porcentaje(Apu_Indice_Id) Apu_Indice_Equipo_Porcentaje

FROM         Apu_Oferta_Equipo_Indice














CREATE PROCEDURE [dbo].[Apu_Oferta_Transporte_Indice_Select]
(
  @p_Ver_Version_Id VARCHAR(17)
)
AS
	SET NOCOUNT ON;
SELECT   
    Id,
    Codigo,
    Apu_Oferta_Id,
    Apu_Indice_Id,
    Porcentaje,
    Estado,

    dbo._Apu_Oferta_Codigo (Apu_Oferta_Id) Apu_Oferta_Codigo,
    dbo._Apu_Oferta_Nombre (Apu_Oferta_Id) Apu_Oferta_Nombre,
    dbo._Apu_Oferta_Etapa  (Apu_Oferta_Id) Apu_Oferta_Etapa,
    
    dbo._Apu_Indice_Codigo (Apu_Indice_Id) Apu_Indice_Codigo,
    dbo._Apu_Indice_Nombre (Apu_Indice_Id) Apu_Indice_Nombre,

    dbo._Apu_Oferta_Costo_Transporte (apu_Oferta_id) Costo_Total,
    dbo._Apu_Oferta_Transporte_Indice_Costo_X_Porcentaje (Id) Costo_Indice,

    dbo._Apu_Oferta_Int_Moneda_Simbolo (Apu_Oferta_Id) Int_Moneda_Simbolo,

    dbo.Estado ('APU_OFERTA_TRANSPORTE_INDICE', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre

FROM         Apu_Oferta_Transporte_Indice


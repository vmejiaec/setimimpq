CREATE PROCEDURE [dbo].[Apu_Proyecto_Transporte_Indice_ById]
(
  @p_Ver_Version_Id VARCHAR(17),
  @p_Id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT   
    Id,
    Codigo,
    Apu_Proyecto_Id,
    Apu_Indice_Id,
    Porcentaje,
    Estado,

    dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id)           Apu_Proyecto_Codigo,
    dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id)           Apu_Proyecto_Nombre,
    dbo._Apu_Proyecto_Etapa  (Apu_Proyecto_Id)           Apu_Proyecto_Etapa,
    dbo._Apu_Proyecto_Costo_Transporte (Apu_Proyecto_id) Apu_Proyecto_Costo_Transporte,
    
    dbo._Apu_Indice_Codigo (Apu_Indice_Id) Apu_Indice_Codigo,
    dbo._Apu_Indice_Nombre (Apu_Indice_Id) Apu_Indice_Nombre,

    dbo._Apu_Proyecto_Costo_Transporte (apu_proyecto_id) Costo_Total,
    dbo._Apu_Proyecto_Transporte_Indice_Costo_X_Porcentaje (Id) Costo_Indice,

    dbo._Apu_Proyecto_Int_Moneda_Simbolo (Apu_Proyecto_Id) Int_Moneda_Simbolo,

    dbo.Estado ('APU_PROYECTO_TRANSPORTE_INDICE', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre

FROM         Apu_Proyecto_Transporte_Indice
Where  Id = @p_Id















CREATE PROCEDURE [dbo].[Apu_Oferta_Equipo_ByEquipo]
(
  @p_Ver_Version_Id VARCHAR(17),
   @p_Apu_Equipo_Id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT   
    Id,
    Codigo,
    Apu_Oferta_Id,
    Apu_Equipo_Id,
    Estado,

    dbo._Apu_Oferta_Codigo (Apu_Oferta_Id) Apu_Oferta_Codigo,
    dbo._Apu_Oferta_Nombre (Apu_Oferta_Id) Apu_Oferta_Nombre,
    dbo._Apu_Oferta_Etapa (Apu_Oferta_Id) Apu_Oferta_Etapa,
    
    dbo._Apu_Equipo_Codigo (Apu_Equipo_Id) Apu_Equipo_Codigo,
    dbo._Apu_Equipo_Nombre (Apu_Equipo_Id) Apu_Equipo_Nombre,
    
    dbo._Apu_Oferta_Rubro_Costo_Equipo1 (apu_oferta_id, apu_equipo_id) Costo,

    dbo._Apu_Oferta_Equipo_Indice_Suma_Porcentaje (Id) Suma_porcentaje_Equipo_Indice,
    dbo._Apu_Oferta_Equipo_Indice_Suma_Porcentaje (Id) Suma_porcentaje_Equipo_Indice_1,

    dbo._Apu_Oferta_Int_Moneda_Simbolo (Apu_Oferta_Id) Int_Moneda_Simbolo,
    dbo.Estado ('APU_OFERTA_EQUIPO', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre

FROM         Apu_Oferta_Equipo
Where  Apu_Equipo_Id =  @p_Apu_Equipo_Id

















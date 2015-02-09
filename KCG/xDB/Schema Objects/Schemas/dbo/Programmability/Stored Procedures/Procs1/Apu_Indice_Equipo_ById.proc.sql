CREATE PROCEDURE [dbo].[Apu_Indice_Equipo_ById]
(
   @p_Ver_Version_Id varchar (17),
   @p_Id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT    
    Id,
    Codigo,
    Apu_Indice_Id,
    Porcentaje,
    Int_Empresa_Id,
    Estado,
    
    
    dbo._Apu_Indice_Codigo(Apu_Indice_Id) Apu_Indice_Codigo,
    dbo._Apu_Indice_Nombre(Apu_Indice_Id) Apu_Indice_Nombre,

    dbo._Int_Empresa_Codigo (Int_Empresa_Id) Int_empresa_Codigo,
    dbo._Int_Empresa_Nombre (Int_Empresa_Id) Int_Empresa_nombre,
 
    dbo.Estado ('APU_INDICE_EQUIPO', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre
FROM         Apu_Indice_Equipo
Where  Id = @p_Id

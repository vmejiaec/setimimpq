CREATE PROCEDURE [dbo].[Apu_Lugar_ByCodigo]
(
   @p_Ver_Version_Id varchar (17),
   @p_Codigo varchar (200)
)
AS
	SET NOCOUNT ON;
SELECT     
    Id,
    Codigo, 
    Nombre, 
    Apu_Provincia_Id,
    Int_Empresa_Id,
    Predeterminada,
    Estado,

    dbo._Int_Empresa_Codigo (Int_Empresa_Id) Int_empresa_Codigo,
    dbo._Int_Empresa_Nombre (Int_Empresa_Id) Int_Empresa_nombre,

    dbo._Apu_Provincia_Codigo (Apu_Provincia_Id) Apu_Provincia_Codigo,
    dbo._Apu_Provincia_Nombre (Apu_Provincia_Id) Apu_Provincia_Nombre,
   
    dbo.Dominio('APU_LUGAR','PREDETERMINADA',Predeterminada,@p_ver_version_id) Predeterminada_Nombre,
    dbo.Estado ('APU_LUGAR', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre
FROM         Apu_Lugar
Where  Codigo = @p_Codigo



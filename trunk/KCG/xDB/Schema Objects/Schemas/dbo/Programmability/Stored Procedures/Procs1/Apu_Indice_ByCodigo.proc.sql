CREATE PROCEDURE [dbo].[Apu_Indice_ByCodigo]
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
    Int_Empresa_Id,
    Varios,
    Estado,
  
    dbo._Int_Empresa_Codigo (Int_Empresa_Id) Int_empresa_Codigo,
    dbo._Int_Empresa_Nombre (Int_Empresa_Id) Int_Empresa_nombre,
    
    dbo.Dominio('APU_INDICE','VARIOS',varios,@p_ver_version_id) Varios_Nombre,
    dbo.Estado ('APU_INDICE', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre
FROM         Apu_Indice
Where  Codigo = @p_Codigo


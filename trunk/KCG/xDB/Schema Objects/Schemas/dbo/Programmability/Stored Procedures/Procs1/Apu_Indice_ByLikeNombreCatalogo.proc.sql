
CREATE PROCEDURE [dbo].[Apu_Indice_ByLikeNombreCatalogo]
(
    @p_Ver_Version_Id varchar (17),
	@p_Fis_Catalogo_Id varchar (17),
	@p_Apu_Indice_Nombre varchar (500)
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
Where Id not in (
	Select Apu_Indice_Id 
	From Fis_Catalogo_Indice 
	Where Fis_Catalogo_Indice.Fis_Catalogo_Id = @p_Fis_Catalogo_Id)
And Nombre like upper(@p_Apu_Indice_Nombre)




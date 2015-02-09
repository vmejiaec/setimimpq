CREATE PROCEDURE [dbo].[Apu_Indice_ByLikeSoloMaterial]
(
   @p_Ver_Version_Id varchar (17),
   @P_nombre varchar(500),
   @p_int_empresa_Id varchar(17)
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
  
    '' 
    --dbo._Int_Empresa_Codigo (Int_Empresa_Id) 
    Int_empresa_Codigo,

    ''
    --dbo._Int_Empresa_nombre (Int_Empresa_Id) 
    Int_Empresa_nombre,
    
    '' 
    --dbo.dominio('APU_INDICE','VARIOS',varios,@p_ver_version_id) 
	Varios_Nombre,
    '' --dbo.estado ('APU_INDICE', 'ESTADO', Estado, @p_Ver_Version_Id ) 
    Estado_Nombre

FROM         Apu_Indice
WHERE upper(Nombre) like (upper(@p_nombre))
AND int_empresa_id = @p_int_empresa_id

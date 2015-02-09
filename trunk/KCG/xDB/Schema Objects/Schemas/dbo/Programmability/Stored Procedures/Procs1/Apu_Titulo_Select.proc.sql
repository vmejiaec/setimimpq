CREATE PROCEDURE [dbo].[Apu_Titulo_Select]
(
   @p_Ver_Version_Id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT
    Id,
    Codigo,
    Nombre,
    Int_Empresa_Id,
    Estado,

    dbo._Int_Empresa_Codigo (Int_Empresa_Id) Int_empresa_Codigo,
    dbo._Int_Empresa_Nombre (Int_Empresa_Id) Int_Empresa_nombre,
    
    dbo.Estado ('APU_TITULO', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre
FROM         Apu_Titulo

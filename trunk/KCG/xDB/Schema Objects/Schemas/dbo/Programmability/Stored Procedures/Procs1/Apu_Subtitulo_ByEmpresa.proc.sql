CREATE PROCEDURE [dbo].[Apu_Subtitulo_ByEmpresa]
(
   @p_Ver_Version_Id varchar (17),
   @p_Int_Empresa_Id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT    
    Id,
    Codigo, 
    Nombre,
    Apu_Titulo_Id,
    Int_Empresa_Id,
    Estado,
    
    dbo._Int_Empresa_Codigo (Int_Empresa_Id) Int_empresa_Codigo,
    dbo._Int_Empresa_Nombre (Int_Empresa_Id) Int_Empresa_nombre,

    dbo._Apu_Titulo_Codigo (Apu_Titulo_Id) Apu_Titulo_Codigo,
    dbo._Apu_Titulo_Nombre (Apu_Titulo_Id) Apu_Titulo_Nombre,
    
    dbo.Estado ('APU_SUBTITULO', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre
FROM         Apu_Subtitulo
Where  Int_Empresa_Id = @p_Int_Empresa_Id


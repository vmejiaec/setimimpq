CREATE PROCEDURE [dbo].[Apu_Subtitulo_ByCodigo]
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
    Apu_Titulo_Id,
    Int_Empresa_Id,
    Estado,
    
    dbo._Int_Empresa_Codigo (Int_Empresa_Id) Int_empresa_Codigo,
    dbo._Int_Empresa_Nombre (Int_Empresa_Id) Int_Empresa_nombre,

    dbo._Apu_Titulo_Codigo (Apu_Titulo_Id) Apu_Titulo_Codigo,
    dbo._Apu_Titulo_Nombre (Apu_Titulo_Id) Apu_Titulo_Nombre,
    
    dbo.Estado ('APU_SUBTITULO', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre
FROM         Apu_Subtitulo
Where  Codigo = @p_Codigo

CREATE PROCEDURE [dbo].[Apu_Oferta_Categoria_Select]
(
	 @p_Ver_Version_Id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT     
	Id,
	Codigo,
	Apu_Oferta_Id,
	Apu_Categoria_Id,
	Costo_Diario,
	Estado,

    dbo._Apu_Oferta_Codigo (Apu_Oferta_Id) Apu_Oferta_Codigo,
    dbo._Apu_Oferta_Nombre (Apu_Oferta_Id) Apu_Oferta_Nombre,
    dbo._Apu_Oferta_Etapa (Apu_Oferta_Id) Apu_Oferta_Etapa,

    dbo._Apu_Categoria_Codigo (Apu_Categoria_Id) Apu_Categoria_Codigo,
    dbo._Apu_Categoria_Nombre (Apu_Categoria_Id) Apu_Categoria_Nombre,
    
    dbo._Apu_Categoria_Int_Empresa_Id (Apu_Categoria_Id) Int_Empresa_id, 
    dbo._Int_Empresa_Codigo (dbo._Apu_Categoria_Int_Empresa_Id (Apu_Categoria_Id)) Int_Empresa_Codigo,
    dbo._Int_Empresa_Nombre (dbo._Apu_Categoria_Int_Empresa_Id (Apu_Categoria_Id)) Int_Empresa_Nombre,
     
    dbo._Apu_Oferta_Categoria_Costo_Hora (Id) Costo_Hora,
	dbo._Apu_Oferta_Int_Moneda_Simbolo (Apu_Oferta_Id) Int_Moneda_Simbolo,
              
    dbo.Estado ('APU_OFERTA_CATEGORIA', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre

FROM         Apu_Oferta_Categoria
CREATE PROCEDURE [dbo].[Apu_Proyecto_Categoria_ByCodigo]
(
   @p_Ver_Version_Id varchar (17),
   @p_Codigo varchar (200)
)
AS
	SET NOCOUNT ON;
SELECT     
    Id,
    Codigo, 
    Apu_Proyecto_Id,
    Apu_Categoria_Id,
    Costo_Diario,
    Estado,

    dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) Apu_Proyecto_Codigo,
    dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id) Apu_Proyecto_Nombre,
    dbo._Apu_Proyecto_Etapa (Apu_Proyecto_Id) Apu_Proyecto_Etapa,

    dbo._Apu_Categoria_Codigo (Apu_Categoria_Id) Apu_Categoria_Codigo,
    dbo._Apu_Categoria_Nombre (Apu_Categoria_Id) Apu_Categoria_Nombre,
    
    dbo._Apu_Categoria_Int_Empresa_Id (Apu_Categoria_Id) Int_Empresa_id, 
    dbo._Int_Empresa_Codigo (dbo._Apu_Categoria_Int_Empresa_Id (Apu_Categoria_Id)) Int_Empresa_Codigo,
    dbo._Int_Empresa_Nombre (dbo._Apu_Categoria_Int_Empresa_Id (Apu_Categoria_Id)) Int_Empresa_Nombre,
     
    dbo._Apu_Proyecto_Categoria_Costo_Hora (Id) Costo_Hora,
	dbo._Apu_Proyecto_Int_Moneda_Simbolo (apu_proyecto_id) Int_Moneda_Simbolo,
              
    dbo.Estado ('APU_PROYECTO_CATEGORIA', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre
FROM       Apu_Proyecto_Categoria
Where  Codigo = @p_Codigo






















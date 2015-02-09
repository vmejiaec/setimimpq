﻿
CREATE PROCEDURE [dbo].[Apu_Categor_ByLikeNombreCatalogo]
(
   @p_Ver_Version_Id varchar (17),
   @p_Int_Sucursal_Id varchar(17),
   @p_Fis_Catalogo_Id varchar(17),
   @p_Apu_Categoria_Nombre varchar(200)

)
AS
	SET NOCOUNT ON;
SELECT     
    Id,
    Codigo,
    Nombre,
    Int_Empresa_Id,
    Estado,
    Costo_Diario,

    dbo._Apu_Categoria_Costo_Hora (Id) Costo_Hora,
    dbo._Int_Empresa_Codigo (Int_Empresa_Id) Int_Empresa_Codigo,
    dbo._Int_Empresa_Nombre (Int_Empresa_Id) Int_Empresa_Nombre,
    dbo._Int_Moneda_Simbolo (dbo._Int_Sucursal_Int_Moneda_Id (@p_int_sucursal_id)) Int_Moneda_Simbolo,

    dbo.Estado ('APU_CATEGORIA', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre   

FROM         Apu_Categoria
Where Id not in (
	Select Apu_Categoria_Id 
	From Fis_Catalogo_Categoria 
	Where Fis_Catalogo_Categoria.Fis_Catalogo_Id = @p_Fis_Catalogo_Id)
	And Nombre like upper(@p_Apu_Categoria_Nombre)





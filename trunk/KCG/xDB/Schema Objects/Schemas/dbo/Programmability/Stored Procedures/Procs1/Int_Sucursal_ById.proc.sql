CREATE PROCEDURE [dbo].[Int_Sucursal_ById]
(
   @p_Ver_Version_Id varchar (17),
   @p_Id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo, 
   Nombre, 
   Abreviatura, 
   Numero, 
   Predeterminada,
   Int_Empresa_Id, 
   Int_Moneda_Id, 
   Descripcion, 
   Estado,

   dbo._Int_Empresa_Codigo (Int_Empresa_Id) Int_empresa_Codigo,
   dbo._Int_Empresa_Nombre (Int_Empresa_Id) Int_Empresa_nombre,
 
   dbo._Int_Empresa_Imagen (Int_Empresa_Id) Int_Empresa_Imagen,

   dbo._Int_Moneda_Codigo (Int_Moneda_Id) Int_Moneda_Codigo,
   dbo._Int_Moneda_Nombre (int_Moneda_Id) Int_Moneda_Nombre,

   dbo.Estado ('INT_SUCURSAL','ESTADO', estado, @p_ver_version_id) Estado_Nombre,
   dbo._Int_Empresa_Abreviatura (Int_Empresa_Id) Int_Empresa_Abreviatura

FROM   Int_Sucursal

Where  Id = @p_Id



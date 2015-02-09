
CREATE PROCEDURE [dbo].[Int_Empresa_Select]
(
  @p_Ver_Version_Id varchar(17)

)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo, 
   Abreviatura, 
   Nombre, 
   Imagen,
   Descripcion,
   Estado,
   Plan_Cuenta,
   Direccion,
   dbo.Estado ('INT_EMPRESA','ESTADO', Estado, @p_Ver_Version_Id) Estado_Nombre
FROM         Int_Empresa







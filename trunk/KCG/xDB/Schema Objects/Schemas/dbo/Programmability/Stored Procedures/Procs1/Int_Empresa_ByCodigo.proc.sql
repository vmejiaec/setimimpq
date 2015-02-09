CREATE PROCEDURE [dbo].[Int_Empresa_ByCodigo]
(
  @p_Ver_Version_Id varchar(17),
  @p_Codigo varchar(200)
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
where Codigo=@p_Codigo





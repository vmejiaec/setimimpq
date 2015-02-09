CREATE PROCEDURE [dbo].[Int_Moneda_ByCodigo]
(
  @p_Ver_Version_Id varchar(17),
  @p_Codigo varchar(200)
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo, 
   Nombre, 
   Abreviatura,  
   Moneda_Id_Ref,
   Simbolo,
   Descripcion, 
   Estado, 
   
   dbo.Estado ('INT_MONEDA','ESTADO', estado, @p_ver_version_id) Estado_nombre 
FROM  Int_Moneda
where Codigo=@p_Codigo



﻿CREATE PROCEDURE [dbo].[Int_Moneda_Select]
(
  @p_Ver_Version_Id varchar(17)
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




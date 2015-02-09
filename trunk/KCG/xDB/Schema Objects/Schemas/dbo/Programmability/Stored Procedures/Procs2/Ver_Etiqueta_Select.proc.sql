﻿CREATE PROCEDURE [dbo].[Ver_Etiqueta_Select]
(
   @p_Ver_Version_Id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo, 
   Nombre, 
   Ver_Version_Id, 
   Dic_Rotulo_Id, 
   Imagen_Activa, 
   Imagen_Desactiva, 
   Estado,

   dbo._Ver_Version_Codigo (ver_version_id) Ver_Version_Codigo,
   dbo._Ver_Version_Nombre (ver_version_id) Ver_Version_Nombre,

   dbo._Dic_Rotulo_Codigo (dic_rotulo_id) Dic_Rotulo_Codigo,
   dbo._Dic_Rotulo_Nombre (dic_rotulo_id) Dic_Rotulo_nombre,

   dbo.Estado ('VER_ETIQUETA','ESTADO', estado , @p_ver_version_id) estado_nombre
FROM  Ver_Etiqueta
WHERE Ver_Version_id=@p_Ver_Version_Id



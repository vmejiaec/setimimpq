CREATE PROCEDURE [dbo].[Par_Recursos_Base]
(
   @p_ver_version_id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT     
   Tipo Origen,
   Dominio Tipo, 
   Nombre, 
   dbo._Ver_Etiqueta_Nombre1(@p_ver_version_id, dbo._Dic_Rotulo_Codigo (dic_rotulo_id)) Ver_Etiqueta_Nombre,
   dbo._Ver_Etiqueta_Nombre1(@p_ver_version_id, dbo._Dic_Rotulo_Codigo (tool_dic_rotulo_id)) Tool_Ver_Etiqueta_Nombre,
   dbo._Ver_Etiqueta_Imagen_Activa (@p_ver_version_id, dbo._Dic_Rotulo_Codigo (dic_rotulo_id)) Ver_Etiqueta_Imagen_Activa,
   dbo._Ver_Etiqueta_Imagen_Desactiva (@p_ver_version_id, dbo._Dic_Rotulo_Codigo (dic_rotulo_id)) Ver_Etiqueta_Imagen_Desactiva
FROM  Dic_General
WHERE TIPO IN ('GEN','FIL','TEC','NAV')
UNION
SELECT 
  'MSJ' Origen, 
  Tipo Tipo,
  Codigo_Mensaje Nombre,
  dbo._Ver_Mensaje_Nombre(@p_ver_version_id,id) Ver_etiqueta_nombre,
  dbo._Ver_Mensaje_Nombre(@p_ver_version_id,id) Tool_Ver_etiqueta_nombre,
  ' ' ver_etiqueta_imagen_activa,
  ' ' ver_etiqueta_imagen_desactiva 
FROM Par_Mensaje


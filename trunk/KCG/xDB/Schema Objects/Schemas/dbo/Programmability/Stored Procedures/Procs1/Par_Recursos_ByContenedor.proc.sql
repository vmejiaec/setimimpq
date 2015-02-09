CREATE PROCEDURE [dbo].[Par_Recursos_ByContenedor]
(
   @p_ver_version_id varchar (17),
   @p_dic_contenedor_id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT     
  'ELEMENTO' Origen,
  Tipo, 
  Nombre, 
  dbo._Ver_Etiqueta_Nombre1(@p_ver_version_id,dic_rotulo_id) Ver_etiqueta_nombre,
  dbo._Ver_Etiqueta_Nombre1(@p_ver_version_id,tool_dic_rotulo_id) Tool_Ver_etiqueta_nombre,
  0 orden,
  null dic_objeto_nombre
FROM         Dic_Con_Elemento
Where Dic_Contenedor_id = @p_dic_Contenedor_Id
UNION
SELECT     
  'CAMPO' Origen, 
  'LAB' Tipo,
  dbo._Dic_Campo_Nombre (dic_campo_id) Nombre,
  dbo._Ver_Etiqueta_Nombre1(@p_ver_version_id,dic_rotulo_id) Ver_etiqueta_nombre,
  dbo._Ver_Etiqueta_Nombre1(@p_ver_version_id,tool_dic_rotulo_id) Tool_Ver_etiqueta_nombre,
  dbo._Dic_Con_Objeto_Orden (Dic_con_objeto_id) Orden,
  dbo._Dic_Objeto_Nombre (dbo._Dic_Campo_Dic_Objeto_Id (Dic_Campo_Id)) Dic_Objeto_nombre
FROM dic_con_campo
WHERE dbo._Dic_Con_Objeto_Dic_Contenedor_Id (Dic_Con_Objeto_Id) = @p_dic_contenedor_id











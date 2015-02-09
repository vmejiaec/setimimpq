CREATE PROCEDURE [dbo].[Dic_Con_Campo_Select]
(
  @p_Ver_Version_Id varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT     
  Id, 
  Codigo, 
  Dic_Con_Objeto_Id, 
  Dic_Campo_Id, 
  Dic_Rotulo_Id, 
  Tool_Dic_Rotulo_Id, 
  Estado, 
  Ancho, 
  Orden,

  dbo._Dic_Con_Objeto_Codigo (Dic_con_Objeto_Id)  Dic_con_Objeto_Codigo,
  dbo._Dic_Con_Objeto_Nombre (Dic_Con_Objeto_Id)  Dic_con_Objeto_Nombre,
  
  dbo._Dic_Con_Objeto_Dic_Objeto_Id (Dic_Con_Objeto_Id) Dic_Objeto_Id,
  dbo._Dic_Objeto_Codigo (dbo._Dic_Con_Objeto_Dic_Objeto_Id (Dic_Con_Objeto_Id)) Dic_Objeto_Codigo,
  dbo._Dic_Objeto_Nombre (dbo._Dic_Con_Objeto_Dic_Objeto_Id (Dic_Con_Objeto_Id)) Dic_Objeto_Nombre,

  dbo._Dic_Con_Objeto_Dic_Contenedor_Id (Dic_Con_Objeto_Id) Dic_Contenedor_Id,
  dbo._Dic_Contenedor_Codigo (dbo._Dic_Con_Objeto_Dic_Contenedor_Id (Dic_Con_Objeto_Id)) Dic_Contenedor_Codigo,
  dbo._Dic_Contenedor_Nombre (dbo._Dic_Con_Objeto_Dic_Contenedor_Id (Dic_Con_Objeto_Id)) Dic_Contenedor_Nombre,
   
  dbo._Dic_Campo_Codigo (dic_campo_id) Dic_Campo_Codigo,
  dbo._Dic_Campo_Nombre (dic_campo_id) Dic_Campo_Nombre,
  
  dbo._Dic_Campo_Dic_Objeto_Id (Dic_Campo_Id) Campo_Dic_Objeto_Id,
  dbo._Dic_Objeto_Codigo (dbo._Dic_Campo_Dic_Objeto_Id (Dic_Campo_Id)) Campo_Dic_Objeto_Codigo,
  dbo._Dic_Objeto_Nombre (dbo._Dic_Campo_Dic_Objeto_Id (Dic_Campo_Id)) Campo_Dic_Objeto_Nombre,
  
  dbo._Dic_Rotulo_Codigo (dic_rotulo_id) Dic_Rotulo_Codigo,
  dbo._Dic_Rotulo_Nombre (dic_rotulo_Id) Dic_Rotulo_nombre,
  
  dbo._Dic_Rotulo_Codigo (tool_dic_rotulo_id) Tool_Dic_Rotulo_Codigo,
  dbo._Dic_Rotulo_Nombre (tool_dic_rotulo_Id) Tool_Dic_Rotulo_nombre,

  dbo.Estado ('DIC_CON_CAMPO','ESTADO', estado , @p_ver_version_id) Estado_Nombre,

  dbo._Ver_Etiqueta_Nombre1(@p_ver_version_id,dbo._Dic_Rotulo_Codigo (dic_rotulo_id)) Ver_etiqueta_nombre,

  dbo._Ver_Etiqueta_Nombre1(@p_ver_version_id,dbo._Dic_Rotulo_Codigo (tool_dic_rotulo_id)) Tool_Ver_etiqueta_nombre

FROM         Dic_Con_Campo









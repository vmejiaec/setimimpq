CREATE PROCEDURE [dbo].[Dic_Con_Elemento_ByTipoLikeEtiqueta]
(
  @p_Ver_Version_Id varchar(17),
  @p_Tipo char(3),
  @p_Nombre varchar(500)
)
AS	SET NOCOUNT ON;
SELECT     
  Id, 
  Codigo, 
  Tipo, 
  Nombre, 
  Dic_Contenedor_id,
  Dic_Rotulo_id, 
  Tool_Dic_Rotulo_Id, 
  Estado,

  dbo.dominio ('DIC_CON_ELEMENTO','TIPO', tipo, @p_ver_version_id) Tipo_Nombre,

  dbo._Dic_Contenedor_Codigo (Dic_Contenedor_Id) Dic_Contenedor_Codigo,
  dbo._Dic_Contenedor_Nombre (Dic_Contenedor_Id) Dic_Contenedor_Nombre,  

  dbo._Dic_Contenedor_Dic_Modulo_id (Dic_contenedor_Id) Contenedor_Dic_Modulo_Id,
  dbo._Dic_Modulo_Codigo (dbo._Dic_Contenedor_Dic_Modulo_id (Dic_contenedor_Id)) Contenedor_Dic_Modulo_Codigo,
  dbo._Dic_Modulo_Nombre (dbo._Dic_Contenedor_Dic_Modulo_id (Dic_contenedor_Id)) Contenedor_Dic_Modulo_Nombre, 
    
  dbo._Dic_Rotulo_Codigo (Dic_Rotulo_Id) Dic_Rotulo_Codigo,
  dbo._Dic_Rotulo_Nombre (Dic_Rotulo_Id) Dic_Rotulo_nombre,
  
  dbo._dic_Rotulo_Codigo (Tool_Dic_Rotulo_Id) Tool_Dic_Rotulo_Codigo,
  dbo._dic_Rotulo_Nombre (Tool_Dic_Rotulo_Id) Tool_Dic_Rotulo_nombre,

  dbo.estado ('DIC_CON_ELEMENTO','ESTADO',estado, @p_ver_version_id ) Estado_Nombre, 

  dbo._ver_etiqueta_Nombre1(@p_ver_version_id,dic_rotulo_id) Ver_etiqueta_nombre,
  dbo._ver_etiqueta_Nombre1(@p_ver_version_id,tool_dic_rotulo_id) Tool_Ver_etiqueta_nombre
FROM    Dic_Con_Elemento
WHERE Tipo = 'MEN'
and upper(dbo._Ver_Etiqueta_Nombre1(@p_Ver_Version_Id,Dic_Rotulo_id)) like upper(@p_Nombre)







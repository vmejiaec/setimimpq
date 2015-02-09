CREATE PROCEDURE [dbo].[Apr_Documento_ByCodigo]
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
  Dic_Campo_id, 
  Descripcion, 
  Estado,
  dbo._Dic_Campo_Codigo (Dic_Campo_Id) Dic_campo_Codigo,
  dbo._Dic_Campo_Nombre (Dic_Campo_Id) Dic_campo_Nombre,
  dbo._Dic_Campo_Dic_Objeto_Id (Dic_Campo_Id) Dic_Objeto_Id,
  dbo._Dic_Objeto_Codigo (dbo._Dic_Campo_Dic_Objeto_Id (Dic_Campo_Id)) Dic_Objeto_codigo,
  dbo._Dic_Objeto_Nombre (dbo._Dic_Campo_Dic_Objeto_Id (Dic_Campo_Id)) Dic_Objeto_nombre,
  dbo._Dic_Objeto_Dic_Modulo_Id (dbo._Dic_Campo_Dic_Objeto_Id (Dic_Campo_Id)) Dic_Modulo_Id,
  dbo._Dic_Modulo_Codigo (dbo._Dic_Objeto_Dic_Modulo_Id (dbo._Dic_Campo_Dic_Objeto_Id (Dic_Campo_Id))) Dic_Modulo_Codigo,
  dbo._Dic_Modulo_Nombre (dbo._Dic_Objeto_Dic_Modulo_Id (dbo._Dic_Campo_Dic_Objeto_Id (Dic_Campo_Id))) Dic_Modulo_Nombre,
  dbo.Estado ('APR_DOCUMENTO','ESTADO', estado, @p_ver_version_id) Estado_Nombre
FROM         Apr_Documento
where   Codigo=@p_Codigo






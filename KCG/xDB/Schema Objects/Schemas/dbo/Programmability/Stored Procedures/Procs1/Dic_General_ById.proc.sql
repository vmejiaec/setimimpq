CREATE PROCEDURE [dbo].[Dic_General_ById]
(
   @p_Ver_Version_Id varchar(17),
   @p_Id varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo, 
   Nombre, 
   Tipo, 
   Dominio,
   Orden,
   Dic_Rotulo_Id,
   Tool_Dic_Rotulo_Id,
   Estado,

   dbo._Dic_Rotulo_Codigo (dic_rotulo_id) Dic_Rotulo_Codigo,
   dbo._Dic_Rotulo_Nombre (dic_rotulo_Id) Dic_Rotulo_nombre,
   dbo._Dic_Rotulo_Codigo (tool_dic_rotulo_id) Tool_Dic_Rotulo_Codigo,
   dbo._Dic_Rotulo_Nombre (tool_dic_rotulo_Id) Tool_Dic_Rotulo_nombre,  

   @p_ver_version_id Ver_Version_Id,
   dbo._Ver_Version_Codigo(@p_ver_version_id) Ver_Version_Codigo,
   dbo._Ver_Version_Nombre(@p_ver_version_id) Ver_Version_Nombre, 
   dbo.Dominio ('DIC_GENERAL','DOMINIO',Dominio, @p_ver_version_id) Dominio_Nombre,
   dbo.Estado ('DIC_GENERAL','ESTADO', estado, @p_ver_version_id) Estado_Nombre,
   dbo.Dominio ('DIC_GENERAL','TIPO',tipo, @p_ver_version_id) Tipo_Nombre,
   dbo._Ver_Etiqueta_Nombre1(@p_ver_version_id, dbo._Dic_Rotulo_Codigo (dic_rotulo_id)) Ver_Version_Nombre,
   dbo._Ver_Etiqueta_Nombre1(@p_ver_version_id, dbo._Dic_Rotulo_Codigo (tool_dic_rotulo_id)) Tool_Ver_Version_Nombre

FROM  Dic_General
where Id=@p_Id











﻿CREATE PROCEDURE [dbo].[Ver_Dominio_ByObjetoCampo]
(
    @p_Ver_Version_Id  varchar(17),
    @p_Dic_Objeto_Nombre varchar(500),
    @p_Dic_Campo_Nombre varchar(500)
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo, 
   Nombre, 
   Ver_Version_id, 
   Dic_Dominio_id, 
   Estado,

   dbo._Ver_Version_Codigo(ver_version_id) ver_version_codigo,
   dbo._Ver_Version_Nombre (ver_version_id)ver_version_nombre,

   dbo._Dic_Dominio_Codigo (dic_dominio_id) dic_dominio_codigo,
   dbo._Dic_Dominio_Nombre (dic_dominio_id) dic_dominio_nombre,
   LTRIM(RTRIM(dbo._Dic_Dominio_Dominio (dic_dominio_id))) Dic_Dominio_Dominio,

   dbo._Dic_Dominio_Dic_Campo_Id (dic_dominio_id) Dic_campo_id,
   dbo._Dic_Campo_Codigo (dbo._Dic_Dominio_Dic_Campo_Id (dic_dominio_id)) Dic_Campo_Codigo,
   dbo._Dic_Campo_Nombre (dbo._Dic_Dominio_Dic_Campo_Id (dic_dominio_id)) Dic_Campo_Nombre,

   dbo.Estado ('VER_DOMINIO','ESTADO', estado, @p_ver_version_id) Estado_Nombre,

   dbo._Dic_Dominio_Dic_Objeto_Id (dic_dominio_id) Dic_objeto_id,
   dbo._Dic_Objeto_Codigo (dbo._Dic_Dominio_Dic_Objeto_Id (dic_dominio_id)) Dic_Objeto_codigo,
   dbo._Dic_Objeto_Nombre (dbo._Dic_Dominio_Dic_Objeto_Id (dic_dominio_id)) Dic_Objeto_nombre

FROM         Ver_Dominio
Where UPPER (dbo._Dic_Campo_Nombre (dbo._Dic_Dominio_Dic_Campo_Id (dic_dominio_id))) = UPPER(@p_dic_campo_nombre) 
AND   UPPER(dbo._Dic_Objeto_Nombre (dbo._Dic_Dominio_Dic_Objeto_Id (dic_dominio_id))) = UPPER (@p_dic_objeto_nombre)
AND Ver_Version_id=@p_ver_version_id













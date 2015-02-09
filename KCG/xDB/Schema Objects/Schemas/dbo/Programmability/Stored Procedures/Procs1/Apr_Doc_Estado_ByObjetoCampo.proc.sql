﻿

CREATE PROCEDURE [dbo].[Apr_Doc_Estado_ByObjetoCampo]
(
  @p_ver_version_id varchar (17),
  @p_Objeto_Nombre varchar (500),
  @p_Campo_Nombre varchar (500)
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo, 
   Estado, 
   Apr_Estado_Id, 
   Apr_Documento_Id, 
   Descripcion,
   Orden,

   dbo._Apr_Estado_Codigo (Apr_Estado_Id) Apr_Estado_Codigo,
   dbo._Apr_Estado_Nombre (Apr_Estado_Id) Apr_Estado_Nombre,
   dbo._Apr_Estado_Dominio (Apr_Estado_Id) Apr_Estado_Dominio,
   dbo._Apr_Documento_Codigo (Apr_Documento_Id) Apr_Documento_codigo,
   dbo._Apr_Documento_Nombre (Apr_Documento_Id) Apr_Documento_nombre,
   dbo._Apr_Documento_Dic_Campo_Id (apr_documento_id) Dic_Campo_Id,
   dbo._Dic_Campo_Codigo (dbo._Apr_Documento_Dic_Campo_Id (apr_documento_id)) Dic_Campo_Codigo,
   dbo._Dic_Campo_Nombre (dbo._Apr_Documento_Dic_Campo_Id (apr_documento_id)) Dic_Campo_Nombre,
   dbo._Dic_Campo_Tipo_Dato (dbo._Apr_Documento_Dic_Campo_Id (apr_documento_id)) Dic_Campo_Tipo_Dato,
   dbo._Dic_Campo_Tipo_Constraint (dbo._Apr_Documento_Dic_Campo_Id (apr_documento_id)) Dic_Campo_Constraint,
   dbo._Dic_Campo_Dic_Objeto_Id (dbo._Apr_Documento_Dic_Campo_Id (apr_documento_id)) Dic_Objeto_Id,
   dbo._Dic_Objeto_Codigo (dbo._Dic_Campo_Dic_Objeto_Id (dbo._Apr_Documento_Dic_Campo_Id (apr_documento_id))) Dic_Objeto_Codigo,
   dbo._Dic_Objeto_Nombre (dbo._Dic_Campo_Dic_Objeto_Id (dbo._Apr_Documento_Dic_Campo_Id (apr_documento_id))) Dic_Objeto_Nombre,
   dbo.Estado('APR_DOC_ESTADO','ESTADO', estado, @p_ver_version_id) Estado_Nombre,

   dbo.Ver_Doc_Estado_Nombre (@p_ver_version_id,Id) Ver_Doc_Estado_Nombre,
   dbo.Ver_Doc_Estado_Descripcion (@p_ver_version_id,Id) Ver_Doc_Estado_Descripcion

FROM  Apr_Doc_Estado

WHERE upper(@p_Objeto_Nombre) = upper(dbo.Dic_Objeto_Nombre (dbo.Dic_Campo_Dic_Objeto_Id (dbo.Apr_Documento_Dic_Campo_Id (Apr_Documento_Id))))
 and  upper(@p_Campo_Nombre) = upper(dbo.Dic_Campo_Nombre (dbo.Apr_Documento_Dic_Campo_Id (Apr_Documento_Id)))
order by Orden 
















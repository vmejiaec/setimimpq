CREATE PROCEDURE [dbo].[Ver_Documento_ById]
(
  @p_Ver_Version_Id varchar (17),
  @p_Id varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT     
    Id, 
    Codigo, 
    Nombre, 
    Apr_Documento_Id, 
    Ver_Version_id, 
    Estado,

    dbo._Apr_Documento_Codigo (apr_documento_id ) apr_Documento_Codigo,
    dbo._Apr_Documento_Nombre (apr_documento_id) Apr_Documento_Nombre,

    dbo._Ver_Version_Codigo (ver_version_id) ver_version_codigo,
    dbo._Ver_Version_Nombre (ver_version_id) ver_version_nombre,

    dbo._Apr_Documento_Dic_Campo_Id(apr_documento_id) Dic_Campo_id,
    dbo._Dic_Campo_Codigo(dbo._Apr_Documento_Dic_Campo_Id(apr_documento_id)) Dic_Campo_Codigo,
    dbo._Dic_Campo_Nombre(dbo._Apr_Documento_Dic_Campo_Id(apr_documento_id)) Dic_Campo_Nombre,
 
    dbo.Estado('VER_DOCUMENTO','ESTADO',estado, @p_ver_version_id) Estado_Nombre

FROM         Ver_Documento
where Id=@p_Id AND Ver_Version_id=@p_Ver_Version_Id




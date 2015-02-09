CREATE PROCEDURE [dbo].[Ver_Doc_Estado_ByCodigo]
(  
   @p_Ver_Version_Id varchar (17),
   @p_Codigo varchar(200)
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo, 
   Nombre, 
   Ver_Version_Id, 
   Apr_Doc_Estado_Id, 
   Estado,
   Descripcion,

   dbo._Ver_Version_Codigo (ver_version_id) ver_version_codigo,
   dbo._Ver_Version_Nombre (ver_version_id) ver_version_nombre,
   dbo._Apr_Doc_Estado_Codigo (apr_doc_estado_id) Apr_doc_estado_Codigo,
   dbo._Apr_Doc_Estado_Nombre (apr_doc_estado_id) Apr_doc_estado_Nombre,
   dbo._Apr_Doc_Estado_Dic_Campo_Id (apr_doc_estado_id) Dic_Campo_Id,
   dbo._Dic_Campo_Codigo (dbo._Apr_Doc_Estado_Dic_Campo_Id (apr_doc_estado_id)) Dic_Campo_Codigo,
   dbo._Dic_Campo_Nombre (dbo._Apr_Doc_Estado_Dic_Campo_Id (apr_doc_estado_id)) Dic_Campo_Nombre,
   
   dbo._Apr_Doc_Estado_Apr_Estado_Dominio(Apr_Doc_Estado_Id) Apr_Estado_Dominio,
    
   dbo.Estado ('VER_DOC_ESTADO','ESTADO',estado, @p_ver_version_id) estado_nombre

FROM         Ver_Doc_Estado
where Codigo=@p_Codigo AND Ver_Version_id=@p_Ver_Version_Id









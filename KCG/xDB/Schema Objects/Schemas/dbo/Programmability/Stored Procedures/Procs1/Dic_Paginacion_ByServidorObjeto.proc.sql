CREATE  PROCEDURE [dbo].[Dic_Paginacion_ByServidorObjeto]
(
  @p_ver_version_id varchar(17),
  @p_Par_Servidor_Id varchar(17),
  @p_dic_objeto_Id varchar(17) 
)
AS
	SET NOCOUNT ON;
SET NOCOUNT OFF;

select    
   Id,
   Codigo,
   Dic_Objeto_Id,
   Par_Servidor_Id,
   Id_Inicial, 
   Id_Final,
   Secuencia,
   Estado,
 
   dbo._Dic_Objeto_Codigo (Dic_Objeto_Id) Dic_Objeto_Codigo,
   dbo._Dic_Objeto_Nombre (Dic_Objeto_Id) Dic_Objeto_Nombre,  
   dbo._Par_Servidor_Codigo (Par_Servidor_Id) Par_Servidor_Codigo,
   dbo._Par_Servidor_Nombre (Par_Servidor_Id) Par_Servidor_Nombre,
   dbo._Dic_Objeto_Dic_Modulo_Id (dic_Objeto_id) Dic_Modulo_Id,
   dbo._Dic_Modulo_Codigo (dbo._Dic_Objeto_Dic_Modulo_Id (Dic_Objeto_Id)) Dic_Modulo_Codigo,
   dbo._Dic_Modulo_Nombre (dbo._Dic_Objeto_Dic_Modulo_Id (Dic_Objeto_Id)) Dic_Modulo_Nombre,

   dbo.Estado ('Dic_Paginacion','ESTADO',estado, @p_ver_version_id) Estado_Nombre
FROM [Dic_Paginacion] 
WHERE [Par_Servidor_Id] = @p_Par_Servidor_Id AND 
      [Dic_Objeto_Id]   = @p_Dic_Objeto_Id








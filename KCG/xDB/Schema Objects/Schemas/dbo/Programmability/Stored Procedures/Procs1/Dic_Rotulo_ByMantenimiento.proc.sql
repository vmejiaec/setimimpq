CREATE PROCEDURE [dbo].[Dic_Rotulo_ByMantenimiento]
(
  @p_ver_version_id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo, 
   Estado, 
   Nombre,
   dbo.Estado ('DIC_ROTULO','ESTADO',Estado, @p_ver_version_id) Estado_nombre
FROM         Dic_Rotulo
WHERE ID NOT IN 
(SELECT Dic_Rotulo_Id
 FROM Ver_Etiqueta)
or   (Select count(*) 
       from Ver_Etiqueta 
       where dic_rotulo.id = ver_etiqueta.dic_rotulo_id) 
       < (SELECT COUNT(*) FROM VER_VERSION)




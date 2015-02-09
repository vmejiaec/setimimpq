﻿CREATE PROCEDURE [dbo].[Dic_Objeto_ByMantenimiento1]
(
  @p_ver_version_id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT     
    Id, 
    Codigo, 
    Nombre, 
    Dic_Modulo_Id, 
    Numero,  
    Estado,
    dbo._Dic_Modulo_Codigo (Dic_Modulo_Id) Dic_Modulo_Codigo,
    dbo._Dic_Modulo_Nombre (Dic_Modulo_Id) Dic_Modulo_Nombre,
    dbo.Estado ('DIC_OBJETO','ESTADO',estado, @p_ver_version_id) Estado_Nombre
FROM         Dic_Objeto
WHERE ID NOT IN (
SELECT DIC_OBJETO_ID
FROM DIC_PAR_PAGINACION)
or   (Select count(*) 
      from Dic_Par_Paginacion 
      where dic_objeto.id = dic_objeto.id) 
      <(SELECT COUNT(*) FROM par_servidor)


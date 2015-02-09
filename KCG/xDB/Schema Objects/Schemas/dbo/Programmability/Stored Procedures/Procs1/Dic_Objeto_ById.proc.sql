﻿CREATE PROCEDURE [dbo].[Dic_Objeto_ById]
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
    Dic_Modulo_Id, 
    Numero,  
    Estado,
    dbo._Dic_Modulo_Codigo (Dic_Modulo_Id) Dic_Modulo_Codigo,
    dbo._Dic_Modulo_Nombre (Dic_Modulo_Id) Dic_Modulo_Nombre,

    dbo.Estado ('DIC_OBJETO','ESTADO',estado, @p_ver_version_id) Estado_Nombre
FROM   Dic_Objeto
Where  Id = @p_id





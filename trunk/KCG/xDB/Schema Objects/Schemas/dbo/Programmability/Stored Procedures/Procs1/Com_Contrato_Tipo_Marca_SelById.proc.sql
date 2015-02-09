﻿CREATE PROCEDURE dbo.Com_Contrato_Tipo_Marca_SelById
  (
    @p_Id int
  )
AS
	SET NOCOUNT ON;
SELECT        
  Id, 
  Nombre, 
  Com_Contrato_Tipo_Id, 
  (SELECT cct.Nombre from Com_Contrato_Tipo cct WHERE cct.Id = Com_Contrato_Tipo_Id) Com_Contrato_Tipo_Nombre,
  Origen, 
  Descripcion
FROM            Com_Contrato_Tipo_Marca
WHERE
  Id = @p_Id

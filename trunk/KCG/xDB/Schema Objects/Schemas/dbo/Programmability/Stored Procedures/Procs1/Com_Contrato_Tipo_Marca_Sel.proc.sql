CREATE PROCEDURE dbo.Com_Contrato_Tipo_Marca_Sel
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

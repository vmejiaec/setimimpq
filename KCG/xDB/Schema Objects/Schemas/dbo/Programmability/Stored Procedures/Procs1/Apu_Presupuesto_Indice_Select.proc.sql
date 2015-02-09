CREATE PROCEDURE dbo.Apu_Presupuesto_Indice_Select
AS
	SET NOCOUNT ON;
SELECT     Id, Codigo, Estado, Descripcion, Apu_Origen_Id, Apu_Insumo_Id, Apu_Indice_Id, Apu_Indice_Codigo, Apu_Indice_Nombre, Porcentaje, Costo_Total, 
                      Costo_Indice
FROM         Apu_Presupuesto_Indice
CREATE PROCEDURE [dbo].[Apu_Presupuesto_Rubro_Insumo_Select]
AS
	SET NOCOUNT ON;
SELECT      Id, 
			Codigo, 
			Estado, 
			Descripcion, 
			Origen, 
			Apu_Origen_Id, 
			Apu_Rubro_Id, 
			Apu_Rubro_Codigo, 
			Apu_Rubro_Nombre, 
			Apu_Rubro_Cantidad, 
            Apu_Rubro_Unidad, 
			Insumo, 
			Apu_Insumo_Id, 
			Apu_Insumo_Codigo, 
			Apu_Insumo_Nombre, 
			Apu_Categoria_Id, 
			Apu_Categoria_Codigo, 
            Apu_Categoria_Nombre, 
			Costo_Diario, 
			Rendimiento, 
			Cantidad
FROM        Apu_Presupuesto_Rubro_Insumo
CREATE PROCEDURE [dbo].[Apu_Presupuesto_Cuadrilla_Select]
(
   @p_Ver_Version_Id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT      Id, 
			Codigo, 
			Estado, 
			Apu_Presupuesto_Id, 
			Origen, 
			Origen_Id, 
			Origen_Codigo, 
			Origen_Nombre, 
			Costo_Total, 
			Salario_Real, 
			Numero_Trabajadores, 
			Coeficiente, 
			Costo_Actual,
			Coeficiente *Costo_Actual SRD_x_Coeficiente,

			convert(numeric(17,2), 0) Costo_Planilla,
			convert(numeric(17,2), 0) Costo_Planilla_x_Coeficiente,
			space(200) Fis_Catalogo_Nombre,
			space(17) Fis_Catalogo_Id,
			getdate()    Fis_Catalogo_Fecha_Publicacion

FROM        Apu_Presupuesto_Cuadrilla
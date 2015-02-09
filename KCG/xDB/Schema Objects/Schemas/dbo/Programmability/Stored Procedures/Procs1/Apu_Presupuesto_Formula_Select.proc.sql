CREATE PROCEDURE [dbo].[Apu_Presupuesto_Formula_Select]
(
   @p_Ver_Version_Id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT      Id, 
			Codigo, 
			Estado, 
			Apu_Presupuesto_Id, 
			Apu_Indice_Id, 
			Apu_Indice_Codigo, 
			Apu_Indice_Nombre, 
			Costo_Total, 
			Coeficiente, 
			Letra, 
			Costo_Actual,

			Convert(numeric(17,2),0)	Costo_Planilla,
			Convert (numeric(17,3),0)	Relacion,
			Convert(numeric(17,3),0)	Coeficiente_X_Relacion,
			space(200) Fis_Catalogo_Nombre,
			space(17) Fis_Catalogo_Id

FROM         Apu_Presupuesto_Formula

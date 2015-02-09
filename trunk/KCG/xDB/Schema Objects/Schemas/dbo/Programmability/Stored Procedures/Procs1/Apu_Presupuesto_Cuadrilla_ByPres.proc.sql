CREATE PROCEDURE [dbo].[Apu_Presupuesto_Cuadrilla_ByPres]
(
   @p_Ver_Version_Id varchar (17),
   @p_Apu_Presupuesto_Id varchar(17),
   @p_Estado varchar(3)
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
			convert(numeric(17,3),round(Coeficiente *Costo_Actual,3)) SRD_x_Coeficiente,

			convert(numeric(17,2), 0) Costo_Planilla,
			convert(numeric(17,2), 0) Costo_Planilla_x_Coeficiente,
			space(200) Fis_Catalogo_Nombre,
			space(17) Fis_Catalogo_Id,
			getdate()    Fis_Catalogo_Fecha_Publicacion


FROM        Apu_Presupuesto_Cuadrilla
WHERE Apu_Presupuesto_Id=@p_Apu_Presupuesto_Id
and  (@p_Estado ='%' or Estado like @p_Estado)
order by Coeficiente desc
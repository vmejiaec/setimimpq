CREATE PROCEDURE [dbo].[Apu_Presupuesto_Cuadrilla_ByPlanilla]
(
   @p_Ver_Version_Id varchar (17),
   @p_Apu_Presupuesto_Id varchar(17),
   @p_Fis_Planilla_Id varchar(17),
   @p_Estado varchar(3)   
)
AS
	SET NOCOUNT ON;
BEGIN

	DECLARE
		@v_Fecha_Reajuste smalldatetime,
		@v_Fis_Catalogo_Id varchar(17),
		@v_Fis_Catalogo_Nombre varchar(500),
		@v_Fecha_Publicacion smalldatetime

		-- Se obtiene la fecha de reajuste de la planilla
		if (@p_Estado = 'DIS')

			(Select @v_Fecha_Reajuste = Fecha_Reajuste_Provisional
			From Fis_Planilla
		    Where Fis_Planilla.Id = @p_Fis_Planilla_Id)
		
		else if (@p_Estado = 'REA')

			(Select @v_Fecha_Reajuste = Fecha_Reajuste_Definitivo
			From Fis_Planilla
		    Where Fis_Planilla.Id = @p_Fis_Planilla_Id)

		
		-- Fecha de Publicacion Indice UNO
		(Select @v_Fecha_Publicacion = Max(Fecha_Publicacion) 
			From Fis_Catalogo
			Where Fecha_Publicacion <= @v_Fecha_Reajuste)


		--Obtener el catálogo de publicación de la planilla
		Select @v_Fis_Catalogo_Id = Id,
				@v_Fis_Catalogo_Nombre = Nombre
		From Fis_Catalogo
		Where Fecha_Publicacion = @v_Fecha_Publicacion
		


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
				Costo_Actual, --Costo Base del Proyecto
				Convert(numeric(17,3),Round(Coeficiente *Costo_Actual,3)) SRD_x_Coeficiente, --Coef * Costo Base del Proyecto,
				
				dbo.Fis_Catalogo_CMO_Reajuste(@v_Fis_Catalogo_Id, Origen, Origen_Id) Costo_Planilla,

				-- Costo de la Planilla * Coeficiente
				Convert(numeric(17,3),
				Round (
				(dbo.Fis_Catalogo_CMO_Reajuste(@v_Fis_Catalogo_Id, Origen, Origen_Id)
				*
				Coeficiente),3))

				Costo_Planilla_x_Coeficiente,
				
				@v_Fis_Catalogo_Nombre Fis_Catalogo_Nombre,
				@v_Fis_Catalogo_Id		Fis_Catalogo_Id,
				isnull(@v_Fecha_Publicacion,getdate())    Fis_Catalogo_Fecha_Publicacion

	FROM        Apu_Presupuesto_Cuadrilla
	WHERE Apu_Presupuesto_Id=@p_Apu_Presupuesto_Id
	and  (@p_Estado ='%' or Estado like @p_Estado)

END



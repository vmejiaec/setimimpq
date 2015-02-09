CREATE PROCEDURE [dbo].[Apu_Presupuesto_Formula_ByPlanilla]
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
		@v_ManoObra_Apu_Indice_Id varchar(17),
		@v_Sum_Costo_Planilla_x_Coeficiente numeric(17,3),
		@v_Fecha_Publicacion smalldatetime;

		-- Obtener el indice de Mano de Obra
		Select @v_ManoObra_Apu_Indice_Id = ManoObra_Apu_Indice_Id 
		From Apu_Presupuesto
		Where Id = @p_Apu_Presupuesto_Id

		-- Se obtiene la fecha de reajuste de la planilla
		if (@p_Estado = 'DIS')

			(Select @v_Fecha_Reajuste = Fecha_Reajuste_Provisional
			From Fis_Planilla
		    Where Fis_Planilla.Id = @p_Fis_Planilla_Id)
		
		else if (@p_Estado = 'REA')

			(Select @v_Fecha_Reajuste = Fecha_Reajuste_Definitivo
			From Fis_Planilla
		    Where Fis_Planilla.Id = @p_Fis_Planilla_Id)


		--Obtener el catálogo de publicación de la planilla
		Select @v_Fis_Catalogo_Id = Id,
			   @v_Fis_Catalogo_Nombre = Nombre,
			   @v_Fecha_Publicacion = Fecha_Publicacion
		From Fis_Catalogo
		Where Fecha_Publicacion =
			(Select Max(Fecha_Publicacion) 
			From Fis_Catalogo
			Where Fecha_Publicacion <= @v_Fecha_Reajuste)

		--Se obtiene el indice de Mano de Obra del Proyecto Actual
		Select @v_ManoObra_Apu_Indice_Id = ManoObra_Apu_Indice_Id
		From Apu_Presupuesto
		Where Id = @p_Apu_Presupuesto_Id


	
	Set @v_Sum_Costo_Planilla_x_Coeficiente = isnull(dbo._Apu_Presupuesto_Cuadrilla_Costo_x_Coeficiente_Sum(
				@p_Ver_Version_Id,
				@p_Apu_Presupuesto_Id,
				@p_Fis_Planilla_Id,
				@p_Estado),0.000)

	
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	SELECT		
				Id, 
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

				-- Coeficiente por Relacción
				--CASE Tipo_Planilla WHEN 'ANT' THEN @p_Anticipo_Valor ELSE  dbo.Fis_Planilla_Total(Id) END Total,
				convert(numeric(17,3),round(CASE Apu_Presupuesto_Formula.Apu_Indice_Id
				WHEN @v_ManoObra_Apu_Indice_Id
				THEN @v_Sum_Costo_Planilla_x_Coeficiente
				ELSE 
				 	(ISNULL(Convert(numeric(17,3),
					Round((Select ISNULL( Valor,0)
					From Fis_Catalogo_Indice FC
					Where FC.Apu_Indice_Id = Apu_Presupuesto_Formula.Apu_Indice_Id
					And FC.Fis_Catalogo_Id = @v_Fis_Catalogo_Id),3),3),0)) END,3))		 Costo_Planilla,


				--Relacción Indices = Costo de la Planilla / Costo del Proyecto
				convert(numeric(17,3),round((CASE Apu_Presupuesto_Formula.Apu_Indice_Id
				WHEN @v_ManoObra_Apu_Indice_Id
				THEN @v_Sum_Costo_Planilla_x_Coeficiente
				ELSE
				 	(ISNULL(Convert(numeric(17,2),
					Round((Select ISNULL( Valor,0)
					From Fis_Catalogo_Indice FC
					Where FC.Apu_Indice_Id = Apu_Presupuesto_Formula.Apu_Indice_Id
					And FC.Fis_Catalogo_Id = @v_Fis_Catalogo_Id),3),3),0)) END),3)
					/	(Case Costo_Actual when 0.00 then 1.00 else Costo_Actual end))
								Relacion,


				-- Coeficiente x Relación
				Convert(numeric(17,3),
				Convert(numeric(17,3) ,Coeficiente) 
				*
				convert(numeric(17,3),round((
				
				CASE Apu_Presupuesto_Formula.Apu_Indice_Id
				WHEN @v_ManoObra_Apu_Indice_Id
				THEN @v_Sum_Costo_Planilla_x_Coeficiente
				ELSE
				 	(ISNULL(Convert(numeric(17,2),
					Round((Select ISNULL( Valor,0)
					From Fis_Catalogo_Indice FC
					Where FC.Apu_Indice_Id = Apu_Presupuesto_Formula.Apu_Indice_Id
					And FC.Fis_Catalogo_Id = @v_Fis_Catalogo_Id),3),3),0)) END),3)
					/ 
						Case Costo_Actual when 0.00 then 1.00 else Costo_Actual end))
				Coeficiente_X_Relacion,

				@v_Fis_Catalogo_Nombre  Fis_Catalogo_Nombre,
				@v_Fis_Catalogo_Id Fis_Catalogo_Id
				
	FROM        Apu_Presupuesto_Formula
	WHERE Apu_Presupuesto_Id=@p_Apu_Presupuesto_Id
	and (@p_Estado ='%' or Estado like @p_Estado)
	--And Costo_Actual > 0
	ORDER BY (case @v_ManoObra_Apu_Indice_Id when Apu_Indice_Id  then 0 else 1 end ) 

END


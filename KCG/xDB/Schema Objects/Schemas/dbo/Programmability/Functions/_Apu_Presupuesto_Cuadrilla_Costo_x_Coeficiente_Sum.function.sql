CREATE FUNCTION [dbo].[_Apu_Presupuesto_Cuadrilla_Costo_x_Coeficiente_Sum]
(
	@p_Ver_Version_Id varchar (17),
	@p_Apu_Presupuesto_Id varchar(17),
	@p_Fis_Planilla_Id varchar(17),
	@p_Estado varchar(3)
)
RETURNS numeric(17,3)
BEGIN
     
	DECLARE
		@v_Fecha_Reajuste smalldatetime,
		@v_Fis_Catalogo_Id varchar(17),
		@v_Fis_Catalogo_Nombre varchar(500),
		@v_total numeric(17,3)

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
				@v_Fis_Catalogo_Nombre = Nombre
		From Fis_Catalogo
		Where Fecha_Publicacion =
			(Select Max(Fecha_Publicacion) 
			From Fis_Catalogo
			Where Fecha_Publicacion <= @v_Fecha_Reajuste)



	SELECT      @v_total =
				-- Costo de la Planilla * Coeficiente
				Sum(Convert(numeric(17,3),
				Round (
				(dbo.Fis_Catalogo_CMO_Reajuste(@v_Fis_Catalogo_Id, Origen, Origen_Id)
				*
				Coeficiente),3)
				)) 
	FROM        Apu_Presupuesto_Cuadrilla
	WHERE Apu_Presupuesto_Id=@p_Apu_Presupuesto_Id
	and  (@p_Estado ='%' or Estado like @p_Estado)

    RETURN  isnull(@v_total,0)

END





















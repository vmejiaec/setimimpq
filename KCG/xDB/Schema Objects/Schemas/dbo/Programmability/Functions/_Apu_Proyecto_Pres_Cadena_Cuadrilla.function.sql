CREATE FUNCTION [dbo].[_Apu_Proyecto_Pres_Cadena_Cuadrilla]
(
	@p_apu_presupuesto_id varchar(17),
	@p_Estado varchar(3)
)
RETURNS varchar(2000)
BEGIN

	declare @v_resultado varchar(2000),
			@v_coeficiente numeric(17,3),
			@v_primera varchar(3),
			@V_apu_cuadrilla_nombre varchar(500)
		   
	Set @v_primera = '  '
	Set @v_resultado = 'B = '

    declare c_apu_cuadrilla Cursor For
   
	-- Comienzo de la consulta

	Select Origen_Nombre,
		   Coeficiente	
	from Apu_Presupuesto_Cuadrilla
    where Apu_Presupuesto_Id=@p_apu_presupuesto_id
	and (@p_Estado='%' or Estado like @p_Estado)
	Order by Coeficiente desc

	-- Fin de la consulta

	open c_apu_cuadrilla
	
		fetch next from c_apu_cuadrilla
		into @v_apu_cuadrilla_nombre, @v_coeficiente

    while @@fetch_status = 0    
	begin
		
        --- Se arma la cadena que va a devolver colo resultado la función
        set @v_resultado = @v_resultado + @v_primera +
             + convert(varchar,@v_coeficiente) + '* SR (' + @v_apu_cuadrilla_nombre + ')'
		Set @v_primera = ' + '
        --- Fin del armado de la funcion.

		fetch next from c_apu_cuadrilla
		into @v_apu_cuadrilla_nombre, @v_coeficiente

	end	

	close c_apu_cuadrilla

	return @v_resultado

END


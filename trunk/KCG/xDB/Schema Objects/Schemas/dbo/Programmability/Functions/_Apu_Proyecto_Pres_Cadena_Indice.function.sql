CREATE FUNCTION [dbo].[_Apu_Proyecto_Pres_Cadena_Indice]
(
	@p_apu_presupuesto_id varchar(17),
	@p_apu_origen_id varchar(17),
	@p_Estado varchar(3)
)
RETURNS varchar(2000)
BEGIN

	declare @v_apu_indice_id varchar(17),
            @v_costo_total numeric(17,4),
		    @v_resultado varchar(2000),
			@v_coeficiente numeric(17,3),
			@v_letra varchar(3),
			@v_primera varchar(3),
			@v_Equipo_Apu_Indice_Id varchar(17),
			@v_int_sucursal_id varchar(17)

   -- se obtiene la sucursal del proyecto
   exec @v_int_sucursal_id = dbo._Apu_Proyecto_Int_Sucursal_Id @p_apu_origen_id

   -- Se obtiene el indice del mecanico de mantenimiento
    exec @v_Equipo_Apu_Indice_id = dbo._Apu_Parametros_Equipo_Apu_Indice_Id @v_int_sucursal_id

		   
	Set @v_primera = '  '
	Set @v_resultado = 'Pr= Po* ('

    declare c_apu_indice Cursor For
   
	-- Comienzo de la consulta

		Select 
		Apu_Indice_Id,
	    Costo_Total,
		Coeficiente,
		Letra 
		from Apu_Presupuesto_Formula
		where Apu_Presupuesto_Id=@p_apu_presupuesto_id
        and (@p_Estado='%' or Estado like @p_Estado)
		order by Letra 

	-- Fin de la consulta

	open c_apu_indice
	
		fetch next from c_apu_indice
		into @v_apu_indice_id, @v_costo_total, @v_coeficiente, @v_letra
    while @@fetch_status = 0    
	begin
		
        --- Se arma la cadena que va a devolver con el resultado la función
        set @v_resultado = @v_resultado + @v_primera +
             + convert(varchar,@v_coeficiente) + ' ' + @v_letra + '1/' + @v_letra + '0'
		Set @v_primera = ' + '
        --- Fin del armado de la funcion.
		fetch next from c_apu_indice
		into @v_apu_indice_id, @v_costo_total, @v_coeficiente, @v_letra
	end	

	close c_apu_indice
--	Deallocate c_apu_indice

	set @v_resultado = @v_resultado + ' )'

	return @v_resultado

END

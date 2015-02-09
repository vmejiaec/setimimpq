CREATE FUNCTION [dbo].[_Apu_Oferta_Cadena_Cuadrilla]
(
	@p_apu_oferta_id varchar(17)
)
RETURNS varchar(2000)
BEGIN

	declare @v_resultado varchar(2000),
			@v_coeficiente numeric(17,3),
			@v_primera varchar(3),
			@V_apu_cuadrilla_nombre varchar(500),
			@v_apu_cuadrilla_codigo_dif numeric(17,3),
			@v_contador int,
			@v_apu_cuadrilla_nombre_aux varchar(500),
			@v_coeficiente_aux numeric(17,3),
			@v_resultado_aux varchar(2000)
		   
	Set @v_primera = '  '
	Set @v_resultado_aux = 'B = '
	Set @v_resultado= ' '
	Set @v_apu_cuadrilla_codigo_dif=0
	Set @v_contador=0

    declare c_apu_cuadrilla Cursor For
   
	-- Comienzo de la consulta
	select 
		apu_cuadrilla_nombre,
		coeficiente
	from
	(select 
		dbo._Apu_Categoria_Nombre (Apu_Categoria_Id) Apu_Cuadrilla_Nombre,
		dbo._Apu_Oferta_Cuadrilla_Coeficiente_Categoria_1(@p_apu_oferta_id, apu_categoria_id) Coeficiente
	from
		(select apu_categoria_id from apu_oferta_mano_obra
		where apu_oferta_id = @p_apu_oferta_id and apu_categoria_id is not null
		and  dbo._Apu_Oferta_Mano_Obra_Costo_Total_Categoria (@p_apu_Oferta_id, apu_categoria_id) >0
		group by apu_categoria_id ) Apu_Categoria_Id
	union
	select
		dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) Apu_Cuadrilla_Nombre,
		dbo._Apu_Oferta_Cuadrilla_Coeficiente_ManoObra_1(@p_apu_oferta_id, apu_mano_obra_id)  Coeficiente
	from
		(select Apu_Mano_Obra_Id
		from Apu_oferta_mano_obra
		where apu_categoria_id is null and apu_oferta_id = @p_apu_oferta_id
		and dbo._Apu_Oferta_Mano_Obra_Costo_Total_Cuadrilla(@p_apu_oferta_id, Apu_mano_Obra_Id) > 0
		Group by Apu_Mano_Obra_Id) Apu_Mano_Obra_Id) cuadrilla
	Order by Coeficiente desc


	-- Fin de la consulta

	open c_apu_cuadrilla
	
		fetch next from c_apu_cuadrilla
		into @v_apu_cuadrilla_nombre, @v_coeficiente

    while @@fetch_status = 0    
	begin
		
		set @v_contador=@v_contador + 1
		set @v_apu_cuadrilla_codigo_dif= @v_apu_cuadrilla_codigo_dif+ @v_coeficiente

		if (@v_contador=1)
		BEGIN
			set @v_coeficiente_aux= @v_coeficiente
			set @v_apu_cuadrilla_nombre_aux = @v_apu_cuadrilla_nombre
			END
		ELSE
		BEGIN

			--- Se arma la cadena que va a devolver colo resultado la función
			set @v_resultado = @v_resultado + @v_primera +
				 + convert(varchar,@v_coeficiente) + '* SR (' + @v_apu_cuadrilla_nombre + ')'
			Set @v_primera = ' + '
			--- Fin del armado de la funcion.
		END

		fetch next from c_apu_cuadrilla
		into @v_apu_cuadrilla_nombre, @v_coeficiente

	end	

	close c_apu_cuadrilla

	if (@v_apu_cuadrilla_codigo_dif<>1)
		BEGIN
			set @v_apu_cuadrilla_codigo_dif= 1 -@v_apu_cuadrilla_codigo_dif
			set @v_resultado_aux=@v_resultado_aux + convert(varchar,@v_coeficiente_aux+@v_apu_cuadrilla_codigo_dif) + '* SR (' + @v_apu_cuadrilla_nombre_aux + ')'+ @v_primera
		END 
	ELSE
		BEGIN
			set @v_resultado_aux=@v_resultado_aux + convert(varchar,@v_coeficiente_aux) + '* SR (' + @v_apu_cuadrilla_nombre_aux + ')'+ @v_primera
		END
--
	set @v_resultado=@v_resultado_aux + @v_resultado

	return @v_resultado

END


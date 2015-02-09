CREATE FUNCTION [dbo].[_Apu_Oferta_Cadena_Indice]
(
	@p_apu_oferta_id varchar(17)
)
RETURNS varchar(2000)
BEGIN

	declare @v_apu_indice_id varchar(17),
			@v_apu_indice_codigo varchar(200),
            @v_costo_total numeric(17,4),
		    @v_resultado varchar(2000),
			@v_coeficiente numeric(17,3),
			@v_letra varchar(3),
			@v_primera varchar(3),

 		    @v_int_sucursal_Id varchar(17),
		    @v_int_empresa_id varchar(17),
		    @v_apu_indice_varios_id varchar(17),
		    @v_letra_cursor  char(1),
		    @v_indice_id_cursor varchar(17),
		    @v_ManoObra_apu_indice_id varchar(17),
			@v_Apu_Indice_Codigo_Dif varchar(200),
			@v_coeficiente_Dif numeric(17,3)

    exec @v_int_sucursal_id = dbo._apu_Oferta_int_sucursal_id @p_apu_Oferta_id
    exec @v_int_empresa_id = dbo._int_sucursal_int_empresa_id @v_int_sucursal_id
    exec @v_apu_indice_varios_id = dbo._apu_indice_varios @v_int_empresa_id
    exec @v_ManoObra_apu_indice_id = dbo._apu_parametros_ManoObra_Apu_Indice_Id @v_int_sucursal_id

		   
	Set @v_primera = '  '
	Set @v_resultado = 'Pr= Po* ('

	--Determinar si hay Diferencia en los coeficientes, y el indice al que se debe sumar la diferencia

	select   @v_Apu_Indice_Codigo_Dif= dbo._Apu_Indice_Codigo (dbo._Apu_Indice_Varios(@v_int_empresa_id)) ,
	@v_coeficiente_Dif= (1 - dbo._Apu_Oferta_Coeficiente_Sumatoria (id)) 
	from  apu_oferta
	where id = @p_apu_oferta_id
	and dbo._Apu_Oferta_Costo_Total(id) 
	<> dbo._Apu_Oferta_Indice_Sumatoria (id)

    declare c_apu_indice Cursor For
   
--	-- Comienzo de la consulta
--		select 
--          apu_indice_id,
--		  dbo._apu_oferta_Indice_Costo (@p_apu_oferta_id, Apu_Indice_Id) Costo_Total,
--		  dbo._apu_oferta_Coeficiente (@p_apu_oferta_id, Apu_Indice_Id) Coeficiente,
--		  dbo._apu_oferta_Letra (@p_apu_oferta_id, 
--                    Apu_Indice_Id, 
--                     row_number() over (order by dbo._apu_oferta_Indice_Costo (@p_apu_oferta_id, Apu_Indice_Id)desc)) as Letra 
--		from 
--			(select apu_indice_id
--			from apu_oferta_material
--			where apu_oferta_id = @p_apu_oferta_id
--			and apu_indice_id <> dbo._apu_parametros_Equipo_Apu_Indice_Id(dbo._apu_oferta_int_sucursal_id (@p_apu_oferta_id))
--			group by apu_indice_id
--			union
--			select apu_indice_id
--			from apu_oferta_equipo_indice
--			where apu_indice_id <> 
--				  dbo._apu_parametros_Equipo_Apu_Indice_Id(dbo._apu_oferta_int_sucursal_id (@p_apu_oferta_id))
--			and dbo._apu_oferta_equipo_apu_oferta_id(apu_oferta_equipo_id) = @p_apu_oferta_id
--			group by apu_indice_id
--			union
--			select apu_indice_id 
--			from   apu_oferta_transporte_indice
--			where  apu_oferta_id = @p_apu_oferta_id
--			and    apu_indice_id <> 
--				   dbo._apu_parametros_Equipo_Apu_Indice_Id(dbo._apu_oferta_int_sucursal_id (@p_apu_oferta_id))
--			group by apu_indice_id
--			union
--			select ManoObra_Apu_Indice_Id
--			from apu_parametros
--			where int_sucursal_id = dbo._apu_oferta_int_sucursal_id (@p_apu_oferta_id)) Apu_Indice
--			Order By dbo._apu_oferta_Indice_Costo (@p_apu_oferta_id, Apu_Indice_Id) desc
--	-- Fin de la consulta


		select  Apu_Indice_Id,
			  dbo._Apu_Oferta_Indice_Costo (@p_apu_Oferta_id, Apu_Indice_Id) Costo_Total,
			  dbo._Apu_Oferta_Coeficiente (@p_apu_Oferta_id, Apu_Indice_Id) Coeficiente,
			  Letra ,
			  dbo._Apu_Indice_Codigo(Apu_Indice_Id)Apu_Indice_Codigo

			from 
			(
			select 
			  Apu_Indice_Id,
			  dbo._Apu_Oferta_Letra (@p_apu_Oferta_id, 
									   Apu_Indice_Id, 
									   row_number() over (order by dbo._Apu_Oferta_Indice_Costo (@p_apu_Oferta_id, Apu_Indice_Id)desc)) as Letra 
			from 

			(select apu_indice_id
			from apu_Oferta_material
			where apu_Oferta_id = @p_apu_Oferta_id
			and apu_indice_id <> dbo._Apu_Parametros_Equipo_Apu_Indice_Id(dbo._Apu_Oferta_Int_Sucursal_Id (@p_apu_Oferta_id))
			and  apu_indice_id <> @v_apu_indice_varios_id
			and apu_indice_id <> @v_ManoObra_apu_indice_id
			group by apu_indice_id
			union
			select apu_indice_id
			from apu_Oferta_equipo_indice
			where dbo._Apu_Oferta_Equipo_Apu_Oferta_Id(apu_Oferta_equipo_id) = @p_apu_Oferta_id
			and apu_indice_id <> dbo._Apu_Parametros_Equipo_Apu_Indice_Id(dbo._Apu_Oferta_Int_Sucursal_Id (@p_apu_Oferta_id))
			and  apu_indice_id <> @v_apu_indice_varios_id
			and apu_indice_id <> @v_ManoObra_apu_indice_id

			group by apu_indice_id
			union
			select apu_indice_id 
			from apu_Oferta_transporte_indice
			where apu_Oferta_id = @p_apu_Oferta_id
			and apu_indice_id <> dbo._Apu_Parametros_Equipo_Apu_Indice_Id(dbo._Apu_Oferta_Int_Sucursal_Id (@p_apu_Oferta_id))
			and  apu_indice_id <> @v_apu_indice_varios_id
			and apu_indice_id <> @v_ManoObra_apu_indice_id
			group by apu_indice_id

			) Apu_Indice

			UNION

			select 
			  Apu_Indice_Id,
			  dbo._Apu_Oferta_Letra (@p_apu_Oferta_id, 
									   Apu_Indice_Id, 
									   row_number() over (order by dbo._Apu_Oferta_Indice_Costo (@p_apu_Oferta_id, Apu_Indice_Id)desc)) as Letra 
			  
			from 

			(select apu_indice_id
			from apu_Oferta_material
			where apu_Oferta_id = @p_apu_Oferta_id
			and  apu_indice_id = @v_apu_indice_varios_id
			group by apu_indice_id
			union
			select apu_indice_id
			from apu_Oferta_equipo_indice
			where dbo._Apu_Oferta_Equipo_Apu_Oferta_Id(apu_Oferta_equipo_id) = @p_apu_Oferta_id
			and  apu_indice_id = @v_apu_indice_varios_id
			group by apu_indice_id
			union
			select apu_indice_id 
			from apu_Oferta_transporte_indice
			where apu_Oferta_id = @p_apu_Oferta_id
			and  apu_indice_id = @v_apu_indice_varios_id
			group by apu_indice_id
			union
			select ManoObra_Apu_Indice_Id
			from apu_parametros
			where int_sucursal_id = dbo._Apu_Oferta_Int_Sucursal_Id (@p_apu_Oferta_id)

			) Apu_Indice

			) Apu_Indice

			Order By Letra

	open c_apu_indice
	
		fetch next from c_apu_indice
		into @v_apu_indice_id, @v_costo_total, @v_coeficiente, @v_letra,@v_apu_indice_codigo
    while @@fetch_status = 0    
	begin
		if (@v_apu_indice_codigo=@v_Apu_Indice_Codigo_Dif)
		begin
			Set @v_coeficiente=@v_coeficiente+@v_coeficiente_Dif
		end
        --- Se arma la cadena que va a devolver colo resultado la función
        set @v_resultado = @v_resultado + @v_primera +
             + convert(varchar,@v_coeficiente) + ' ' + @v_letra + '1/' + @v_letra + '0'
		Set @v_primera = ' + '
        --- Fin del armado de la funcion.
		fetch next from c_apu_indice
		into @v_apu_indice_id, @v_costo_total, @v_coeficiente, @v_letra,@v_apu_indice_codigo
	end	

	close c_apu_indice
--	Deallocate c_apu_indice

	set @v_resultado = @v_resultado + ' )'
	return @v_resultado

END


--Select dbo._Apu_Oferta_Cadena_Indice('00086014260552666')
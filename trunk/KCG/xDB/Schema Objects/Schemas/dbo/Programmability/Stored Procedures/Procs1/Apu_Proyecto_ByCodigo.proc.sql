

CREATE PROCEDURE [dbo].[Apu_Proyecto_ByCodigo]
(
   @p_Ver_Version_Id varchar (17),
   @p_Codigo varchar (200)
)
AS
	SET NOCOUNT ON;

--Obtencion de la Sumatoria de la Cuadrilla
	DECLARE @v_Costo_Total numeric(17, 4),
		@v_Coeficiente numeric(17, 3),
		@v_Coeficiente_indice numeric(17, 3),
		@v_letra char(1),
		@v_apu_indice_codigo varchar(200),
		@v_Apu_Indice_Codigo_Dif varchar(200),
		@v_coeficiente_Dif numeric(17, 3),
		@v_resultado varchar(2000),
		@v_resultado_cuadrilla varchar(2000),
        @v_cuadrilla_nombre varchar(500),
		@v_primera varchar(3),
		@v_Costo_Total_Indice numeric(17, 4),
		@v_Coeficiente_Indice_Sum numeric(17, 3),
	    @v_int_sucursal_Id varchar(17),
		@v_int_empresa_id varchar(17),
		@i int ,
		@v_resultado_aux varchar(2000),
		@v_contador int,
		@v_apu_cuadrilla_codigo_dif numeric(17,3),
		@v_apu_cuadrilla_nombre_aux varchar(500),
		@v_coeficiente_aux numeric(17,3),
		@p_Id varchar(17),
		@iRwCnt int ;

	Set @p_Id= (Select Id 
				From Apu_Proyecto 
				Where Codigo = @p_Codigo)

		
-- Se crea la tabla temporal
	CREATE TABLE #Apu_Proyecto_Cuadrilla(
		Id [numeric](18, 0) IDENTITY(1,1) NOT NULL,
		Apu_Proyecto_Id [varchar](17) NULL,
		Apu_proyecto_Codigo [varchar](200)  NULL,
		Apu_Proyecto_Nombre [varchar](200) NULL,
		Apu_proyecto_Etapa [varchar](3) NULL,
		Apu_Cuadrilla_Codigo [varchar](200) NULL,
		Apu_Cuadrilla_Nombre [varchar](500) NULL,
		Costo_Total [numeric](17, 4) NULL,
		Costo_Hora [numeric](17, 2) NULL,
		Numero_trabajadores [numeric](17, 2) NULL,
		Coeficiente [numeric](17, 3) NULL,
		Apu_Categoria_Id [varchar](17) NULL,
		Origen [varchar](3) NULL
	) 

	insert into  #Apu_Proyecto_Cuadrilla
	exec  dbo.Apu_Proyecto_Cuadrilla_Select @p_Id;

	Select @v_Costo_Total =ISNULL(sum(Costo_Total),0),
			@v_Coeficiente = ISNULL(sum(Coeficiente),0)
	From #Apu_Proyecto_Cuadrilla
	Where Apu_Proyecto_Id=@p_Id



-- Se crea la tabla temporal
	CREATE TABLE #Apu_Proyecto_Indice(
		Apu_Proyecto_Id [varchar](17) NULL,
		Apu_proyecto_Codigo [varchar](200)  NULL,
		Apu_Proyecto_Nombre [varchar](200) NULL,
		Apu_proyecto_Etapa [varchar](3) NULL,
		Apu_Indice_Nombre [varchar](500) NULL,
		Apu_Indice_Codigo [varchar](200) NULL,
		Costo_Total [numeric](17, 4) NULL,
		Coeficiente [numeric](17, 3) NULL,
		Letra [char](1) NULL
	) 


	insert into  #Apu_Proyecto_Indice
	exec  dbo.Apu_Proyecto_Indice_Select @p_Id;

	Select @v_Costo_Total_Indice =ISNULL(sum(Costo_Total),0),
			@v_Coeficiente_Indice_Sum = ISNULL(sum(Coeficiente),0)
	From #Apu_Proyecto_Indice
	Where Apu_Proyecto_Id=@p_Id

	--Determinar si hay Diferencia en los coeficientes, y el indice al que se debe sumar la diferencia
    exec @v_int_sucursal_id = dbo._apu_proyecto_int_sucursal_id @p_Id
    exec @v_int_empresa_id = dbo._int_sucursal_int_empresa_id @v_int_sucursal_id

	select @v_Apu_Indice_Codigo_Dif= dbo._Apu_Indice_Codigo (dbo._Apu_Indice_Varios(@v_int_empresa_id)) ,
	@v_coeficiente_Dif=(1 - @v_Coeficiente_Indice_Sum )
	from  Apu_Proyecto
	where id = @p_Id
	and (dbo._Apu_Proyecto_Costo_Directo (id) <> @v_Costo_Total_Indice
	or  @v_Coeficiente_Indice_Sum <> 1)


	Set @v_primera = '  '
	Set @v_resultado = 'Pr= Po* ('
	set @i = 66 --initialize

--Obtencion de la cadena indice

   WHILE @i <= 90 --Recorre hasta la letra Z
	BEGIN
		set @v_letra='A'
		select @v_coeficiente_indice = Coeficiente,
		       @v_letra= Letra,
			   @v_apu_indice_codigo =Apu_Indice_Codigo
		from #Apu_Proyecto_Indice
		Where Apu_Proyecto_Id=@p_Id
		and Letra = char(@i)
		Order By Letra ASC
		if (@v_letra<>'A')
		BEGIN
			if (@v_apu_indice_codigo=@v_Apu_Indice_Codigo_Dif)
				Set @v_coeficiente_indice=@v_coeficiente_indice + @v_coeficiente_Dif
			
			--- Se arma la cadena que va a devolver con los resultados de la función
			set @v_resultado = @v_resultado + @v_primera +
				 + convert(varchar,@v_coeficiente_indice) + ' ' + @v_letra + '1/' + @v_letra + '0'
			Set @v_primera = ' + '
		END	
		Set @i= @i + 1
	END
	set @v_resultado = @v_resultado + ' )'
	drop table #Apu_Proyecto_Indice

-- Obtencion de la Cadena Cuadrilla

	Set @v_primera = '  '
	Set @v_resultado_aux = 'B = '
	Set @v_resultado_cuadrilla=' '
	Set @v_apu_cuadrilla_codigo_dif=0
	Set @v_contador=0
	Set @i=1

	Set @iRwCnt=(Select Count(Apu_Cuadrilla_Codigo) from #Apu_Proyecto_Cuadrilla
				 Where Apu_Proyecto_Id=@p_Id )

   WHILE @i <= @iRwCnt --Recorre 
	BEGIN
		Set @v_cuadrilla_nombre='A'
		select  @v_apu_indice_codigo= Apu_Cuadrilla_Codigo,
				@v_cuadrilla_nombre =apu_cuadrilla_nombre,
				@v_coeficiente_indice=coeficiente
		from #Apu_Proyecto_Cuadrilla
		Where Apu_Proyecto_Id=@p_Id
		and Id = @i

		if (@v_cuadrilla_nombre<>'A')
		
		BEGIN
			
		
			set @v_contador=@v_contador + 1
			set @v_apu_cuadrilla_codigo_dif= @v_apu_cuadrilla_codigo_dif+ @v_coeficiente_indice

			if (@v_contador=1)
				BEGIN
					set @v_coeficiente_aux= @v_coeficiente_indice
					set @v_apu_cuadrilla_nombre_aux = @v_cuadrilla_nombre
				END
			ELSE
			BEGIN

				-- Se arma la cadena que va a devolver colo resultado la función
				set @v_resultado_cuadrilla = @v_resultado_cuadrilla + @v_primera +
					 + convert(varchar,@v_coeficiente_indice) + '* SR (' + @v_cuadrilla_nombre + ')'
--				set @v_resultado_cuadrilla= @v_resultado_cuadrilla + @v_primera + convert(varchar,@v_coeficiente_indice) 	
				Set @v_primera = ' + '
				-- Fin del armado de la funcion.

			END
		END	
		Set @i= @i + 1
	END

 
	if (@v_apu_cuadrilla_codigo_dif<>1)
		BEGIN
			set @v_apu_cuadrilla_codigo_dif= 1 -@v_apu_cuadrilla_codigo_dif
			set @v_resultado_aux=@v_resultado_aux + convert(varchar,@v_coeficiente_aux+@v_apu_cuadrilla_codigo_dif) + '* SR (' + @v_apu_cuadrilla_nombre_aux + ')'+ @v_primera
		END 
	ELSE
		BEGIN
			set @v_resultado_aux=@v_resultado_aux + convert(varchar,@v_coeficiente_aux) + '* SR (' + @v_apu_cuadrilla_nombre_aux + ')'+ @v_primera
		END
	set @v_resultado_cuadrilla=isnull(@v_resultado_aux + @v_resultado_cuadrilla,'')

	drop table #Apu_Proyecto_Cuadrilla


SELECT  Id, 
		Codigo, 
		Codigo_Institucion, 
		Nombre, 
		Apu_Lugar_Id, 
		Area, 
		Porcentaje_Costo_Indirecto, 
		Porcentaje_Costo_Otros, 
		Fecha_Creacion, 
		Coordinador_Per_Personal_Id, 
		Tecnico_Per_Personal_Id, 
		Etapa, 
		Int_Sucursal_Id, 
		Int_Moneda_Id, 
		Fecha_Update, 
		Creacion_Per_Personal_Id, 
		Update_Per_Personal_Id, 
		Estado, 
		Costo_Directo, 
		Costo_Total, 
		Costo_Indirecto, 
		Costo_Otros, 
		Descripcion, 
		Tipo_Contrato,

	dbo._Apu_Lugar_Codigo(Apu_Lugar_Id) AS Apu_Lugar_Codigo, 
	dbo._Apu_Lugar_Nombre(Apu_Lugar_Id) AS Apu_Lugar_Nombre, 
	dbo._Apu_Lugar_Apu_Provincia_Id(Apu_Lugar_Id) AS Apu_provincia_id, 
    dbo._Apu_Provincia_Codigo(dbo._Apu_Lugar_Apu_Provincia_Id(Apu_Lugar_Id)) AS Apu_Provincia_Codigo, 
	dbo._Apu_Provincia_Nombre(dbo._Apu_Lugar_Apu_Provincia_Id(Apu_Lugar_Id)) AS Apu_Provincia_Nombre, 
	dbo._Int_Sucursal_Codigo(Int_Sucursal_Id) AS Int_Sucursal_Codigo, 
	dbo._Int_Sucursal_Nombre(Int_Sucursal_Id) AS Int_Sucursal_Nombre, 
	dbo._Int_Sucursal_Int_Empresa_Id(Int_Sucursal_Id) AS Int_Empresa_Id, 
	dbo._Int_Empresa_Codigo(dbo._Int_Sucursal_Int_Empresa_Id(Int_Sucursal_Id)) AS Int_Empresa_Codigo, 
	dbo._Int_Empresa_Nombre(dbo._Int_Sucursal_Int_Empresa_Id(Int_Sucursal_Id)) AS Int_Empresa_Nombre, 
	dbo._Per_Personal_Codigo(Creacion_Per_Personal_Id) AS Creacion_Per_Personal_Codigo, 
	dbo._Per_Personal_Nombre(Creacion_Per_Personal_Id) AS Creacion_Per_Personal_Nombre, 
	dbo._Per_Personal_Codigo(Update_Per_Personal_Id) AS Update_Per_Personal_Codigo, 
	dbo._Per_Personal_Nombre(Update_Per_Personal_Id) AS Update_Per_Personal_Nombre, 
	dbo._Per_Personal_Codigo(Coordinador_Per_Personal_Id) AS Coordinador_Per_Personal_Codigo, 
	dbo._Per_Personal_Nombre(Coordinador_Per_Personal_Id) AS Coordinador_Per_Personal_Nombre, 
	dbo._Per_Personal_Codigo(Tecnico_Per_Personal_Id) AS Tecnico_Per_Personal_Codigo, 
	dbo._Per_Personal_Nombre(Tecnico_Per_Personal_Id) AS Tecnico_Per_Personal_Nombre, 
	dbo._Int_Moneda_Codigo(Int_Moneda_Id) AS Int_Moneda_Codigo, 
	dbo._Int_Moneda_Nombre(Int_Moneda_Id) AS Int_Moneda_Nombre, 
	dbo._Int_Moneda_Simbolo(Int_Moneda_Id) AS Int_Moneda_Simbolo,
    
	dbo._Apu_Proyecto_Costo_Equipo		(id) Costo_Equipo,
    dbo._Apu_Proyecto_Costo_Mano_Obra	(id) Costo_Mano_Obra,
    dbo._Apu_Proyecto_Costo_Material	(id) Costo_Material,
    dbo._Apu_Proyecto_Costo_Transporte	(id) Costo_Transporte,

    dbo._Apu_Proyecto_Costo_Metro_Cuadrado	(id) Costo_Metro_Cuadrado,

    dbo._Apu_Proyecto_Costo_Indirecto_Otros(Id)  Costo_Indirecto_Otros,

    dbo._Apu_Proyecto_Porcentaje_Costo_Indirecto_Otros(Id)  Porcentaje_Costo_Indirecto_Otros, 

    Costo_Directo Indice_Sumatoria,

    1.000 Coeficiente_Sumatoria,

   	@v_Costo_Total Cuadrilla_Sumatoria,

    @v_Coeficiente Cuadrilla_Coeficiente_Sumatoria,

    dbo._Apu_Proyecto_Transporte_Suma_Porcentaje (Id) Suma_Porcentaje_Indice_Transporte,
 
    dbo.Dominio('APU_PROYECTO','ETAPA',Etapa,@p_ver_version_id) Etapa_Nombre,
    dbo.Estado ('APU_PROYECTO','ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre,

	@v_resultado Cadena_Indice,
	@v_resultado_cuadrilla Cadena_Cuadrilla,

	dbo._Apu_Presupuesto_Estado(Id) Apu_Presupuesto_Estado,
    dbo.Estado ('APU_PRESUPUESTO','ESTADO', dbo._Apu_Presupuesto_Estado(Id), @p_ver_version_Id) Apu_Presupuesto_Estado_Nombre,

    dbo.Dominio('APU_PROYECTO','TIPO_CONTRATO',Tipo_Contrato,@p_ver_version_id) Tipo_Nombre


FROM  Apu_Proyecto
Where  Codigo = @p_Codigo








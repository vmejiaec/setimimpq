CREATE PROCEDURE dbo.Fis_Planilla_Resumen_ById
(
   @p_Ver_Version_Id varchar (17),
   @p_Fis_Planilla_Id varchar(17)
)
AS
	SET NOCOUNT ON;
BEGIN

	DECLARE
		@v_Factor_Reajuste_Provisional NUMERIC(17,4),
		@v_Factor_Reajuste_Definitivo NUMERIC(17,4),
		@v_Fecha_Oferta_Cierre smalldatetime,
		@v_Origen varchar(3),
		@v_Apu_Origen_Id varchar(17),
		@v_Codigo_Institucional varchar(200),
		@v_Contratista_Per_Personal_Nombre varchar(500),
		@v_Contratista_Per_Personal_Id varchar(17),
		@v_Apu_Presupuesto_Costo_Total numeric(17,4),
		@v_Anticipo_Porcentaje numeric(5,2),
		@v_Apu_Presupuesto_Id varchar(17),
		@v_Sum_Coeficiente_DIS numeric(17,4),
		@v_Sum_Coeficiente_REA numeric(17,4),
		@v_Sum_SRD_x_Coeficiente_DIS numeric(17,4),
		@v_Sum_SRD_x_Coeficiente_REA numeric(17,4),
		@v_Sum_Costo_Planilla_x_Coeficiente_DIS numeric(17,4),
		@v_Sum_Costo_Planilla_x_Coeficiente_REA numeric(17,4),
		@v_Sum_Coeficiente_Formula_DIS numeric(17,4),
		@v_Sum_Valor_Actual_DIS numeric(17,2),
		@v_Sum_Coeficiente_x_Relacion_DIS numeric(17,3),	
		@v_Sum_Coeficiente_Formula_REA numeric(17,3),
		@v_Sum_Valor_Actual_REA numeric(17,2),
		@v_Sum_Coeficiente_x_Relacion_REA numeric(17,3),
		@v_Porcentaje_Reajuste_DIS float(10),
		@v_Porcentaje_Reajuste_REA float(10),
		@v_Fis_Planilla_Total_Det numeric(17,2),
		@p_Anticipo_Valor numeric(17,2),
		@v_Fis_Tipo_Planilla char(3),
		@v_Fecha_Contrato_Firma smalldatetime,
		@v_Incremento_Importe_1 numeric(17,2),
		@v_Incremento_Importe_2 numeric(17,2),
--	    @v_Importe_Total  numeric(17,2),
		@v_Contrato_Tipo varchar(200),
		@v_Fecha_Indice_Base smalldatetime,
		@v_Fecha_APU_Aprobacion smalldatetime,
		@v_Fis_Catalogo_Fecha_Publicacion_0 smalldatetime,	
		@v_Fis_Catalogo_Fecha_Publicacion_1_DIS smalldatetime,
		@v_Fis_Catalogo_Fecha_Publicacion_1_REA smalldatetime;
		


		(Select
			@v_Contratista_Per_Personal_Nombre = dbo._Per_Personal_Nombre (Contratista_Per_Personal_Id),
			@v_Contratista_Per_Personal_Id = 	Contratista_Per_Personal_Id,
			@v_Apu_Presupuesto_Costo_Total = Costo_Total,
			@v_Origen = Origen,
			@v_Apu_Origen_Id = Apu_Origen_Id,
			@v_Apu_Presupuesto_Id = Id
		From Apu_Presupuesto
		Where Id =
			(Select Apu_Presupuesto_Id
			 From Fis_Planilla
			 Where Fis_Planilla.Id = @p_Fis_Planilla_Id))
		

	-- Se crea lac tabla temporal para presupuesto
	CREATE TABLE #Apu_Presupuesto_Temporal(
		[Codigo_Institucional] [varchar](200) NULL,
		[Programa] [varchar](200)  NULL,
		[Tipo_Contrato_Legal] [varchar](200) NULL,
		[Ubicacion] [varchar](200) NULL,
		[Proyecto_Nombre] [varchar](200) NULL,
		[SubProyecto_Nombre] [varchar](200) NULL,
		[Categoria] [varchar](200) NULL,
		[Contratista_Cedula] [varchar](200) NULL,
		[Fecha_Contrato_Adjudicacion] [smalldatetime] NULL,
		[Fecha_Contrato_Firma] [smalldatetime] NULL,
		[Fecha_Oferta_Cierre] [smalldatetime] NULL,
		[Fecha_APU_Aprobacion] [smalldatetime] NULL,
		[Plazo] [int] NULL,
		[Anticipo_Porcentaje] [numeric](5, 2) NULL,
		[Coordinador1_Cedula] [varchar](200) NULL,
		[Coordinador2_Cedula] [varchar](200) NULL,
		[Contrato_Tipo] [varchar](200) NULL
	)

	-- Crear tabla temporal para Apu_Presuesto_Cuadrilla
	CREATE TABLE #Apu_Presupuesto_Cuadrilla (
		[Id] [varchar](17) NULL,
		[Codigo] [varchar](200) NULL,
		[Estado] [char](3) NULL,
		[Apu_Presupuesto_Id] [varchar](17) NULL,
		[Origen] [char](3) NULL,
		[Origen_Id] [varchar](17) NULL,
		[Origen_Codigo] [varchar](200) NULL,
		[Origen_Nombre] [varchar](500) NULL,
		[Costo_Total] [numeric](17,4) NULL,
		[Salario_Real] [numeric](17,4) NULL,
		[Numero_Trabajadores] [numeric](17,4) NULL,
		[Coeficiente] [numeric](17,4) NULL,
		[Costo_Actual] [numeric](17,4) NULL,
		[SRD_x_Coeficiente] [numeric](17,3) NULL,
		[Costo_Planilla] [numeric](17,2) NULL,
		[Costo_Planilla_x_Coeficiente] [numeric](17,3) NULL,
		[Fis_Catalogo_Nombre] [varchar](500) NULL,
		[Fis_Catalogo_Id] [varchar](17) NULL ,
		[Fis_Catalogo_Fecha_Publicacion] [smalldatetime] NULL)



	-- Crear tabla temporal para Apu_Presuesto_Cuadrilla
	CREATE TABLE #Apu_Presupuesto_Formula (
		[Id] [varchar](17) NULL,
		[Codigo] [varchar](200) NULL,
		[Estado] [char](3) NULL,
		[Apu_Presupuesto_Id] [varchar](17) NULL,
		[Apu_Indice_Id] [varchar](17) NULL,
		[Apu_Indice_Codigo] [varchar](200) NULL,
		[Apu_Indice_Nombre] [varchar](500) NULL,
		[Costo_Total] [numeric](17,4) NULL,
		[Coeficiente] [numeric](17,4) NULL,
		[Letra] [char](1) NULL,
		[Costo_Actual] [numeric](17,4) NULL,
		[Costo_Planilla] [numeric](17,2) NULL,
		[Relacion] [numeric](17,3) NULL,
		[Coeficiente_x_Relacion] [numeric](17,3) NULL,
		[Fis_Catalogo_Nombre] [varchar](500) NULL,
		[Fis_Catalogo_Id] [varchar](17) NULL )

	--Crear la tabla de los detalles de la planilla
	CREATE TABLE #Fis_Planilla_Det (
		[Id] [varchar](17) NULL,
		[Codigo] [varchar](200) NULL,
		[Estado] [char](3) NULL,
		[Descripcion] [varchar](2000) NULL,
		[Apu_Prespuesto_Rubro_Id] [varchar](17) NULL,
		[Costo] [numeric](17,4),
		[Cantidad] [numeric](17,4),
		[Fis_Planilla_Id] [varchar](17) NULL,
		[Costo_x_Cantidad] [numeric](17,4),
		[Cantidad_Anterior] [numeric](17,4),
		[Cantidad_Actual] [numeric](17,4),
		[Cantidad_Total] [numeric](17,4),
		[Importe_Anterior] [numeric](17,4),
		[Importe_Actual] [numeric](17,4),
		[Importe_Total] [numeric](17,4),
		[Incremento_Cantidad_1] [numeric](17,4),
		[Incremento_Importe_1] [numeric](17,4),
		[Incremento_Cantidad_2] [numeric](17,4),
		[Incremento_Importe_2] [numeric](17,4),
		[Apu_Presupuesto_Rubro_Id] [varchar](17) NULL,
		[Apu_Presupuesto_Rubro_Codigo] [varchar](200) NULL,
		[Apu_Presupuesto_Rubro_Estado] [varchar](3) NULL,
		[Apu_Presupuesto_Rubro_Descripcion] [varchar](2000) NULL,
		[Apu_Prespuesto_Id] [varchar](17) NULL,
		[Apu_Rubro_Id] [varchar](17) NULL,
		[Apu_Rubro_Codigo] [varchar](200) NULL,
		[Apu_Rubro_Nombre] [varchar](500) NULL,
		[Apu_Rubro_Unidad] [varchar](100) NULL,
		[Apu_Rubro_Cantidad] [numeric](17,4) NULL,
		[Apu_Rubro_Costo_Unitario] [numeric](17,4),
		[Apu_Rubro_Costo_Total] [numeric](17,4),
		[Apu_Subtitulo_Id] [varchar](17) NULL,
		[Apu_Subtitulo_Nombre] [varchar](500) NULL,
		[Apu_Titulo_Id] [varchar](17) NULL,
		[Apu_Titulo_Nombre] [varchar](500) NULL
	)


	-- Se obtiene el Código Institucional
	set @v_Codigo_Institucional = dbo._Apu_Presupuesto_Codigo_Institucional(@v_Origen, @v_Apu_Origen_Id);
	set @v_Contrato_Tipo = dbo._Apu_Presupuesto_Tipo_Contrato(@v_Origen, @v_Apu_Origen_Id);

	-------------------------------------------------------------------------
	----- Se obtienen los datos para del contrato del proyecto --------------
	-------------------------------------------------------------------------
	insert into  #Apu_Presupuesto_Temporal
	exec dbo.Int_Contrato_ByCodigo_Institucional @v_Codigo_Institucional, @v_Contrato_Tipo ;

	Select @v_Fecha_Oferta_Cierre  = isnull(Fecha_Oferta_Cierre,getDate()),
		   @v_Anticipo_Porcentaje  = Anticipo_Porcentaje,
		   @v_Fecha_Contrato_Firma = Fecha_Contrato_Firma,
	--	   @v_Contrato_Tipo         = Contrato_Tipo,
		   @v_Fecha_APU_Aprobacion = Fecha_APU_Aprobacion
	From #Apu_Presupuesto_Temporal

	---------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------
	-- Obtener la fecha de la publicación base

	If (ltrim(rtrim(@v_Contrato_Tipo)) = '1') --PRINCIPAL
		set @v_Fecha_Indice_Base =	Dateadd (DAY, -30, isnull(@v_Fecha_Oferta_Cierre,getDate()))
	Else if ((ltrim(rtrim(@v_Contrato_Tipo))) = '0') --COMPLEMENTARIO
		set @v_Fecha_Indice_Base = @v_Fecha_APU_Aprobacion

	-- Fecha de Publicación Indice CERO
	(Select @v_Fis_Catalogo_Fecha_Publicacion_0 = Fecha_Publicacion
		From Fis_Catalogo 
		Where Fecha_Publicacion =
			(Select Max(Fecha_Publicacion)
			From Fis_Catalogo
			Where Fecha_Publicacion <= @v_Fecha_Indice_Base))


	----------------------------------------------------------------------------
	----  Se obtiene el Valor del Anticipo --JPU 06-11-2009
	----------------------------------------------------------------------------
    Set @p_Anticipo_Valor =convert(numeric(17,2), ISNULL(((@v_Apu_Presupuesto_Costo_Total * @v_Anticipo_Porcentaje)/100),0.00))
	(Select @v_Fis_Planilla_Total_Det = CASE Tipo_Planilla WHEN 'ANT' THEN @p_Anticipo_Valor ELSE  dbo.Fis_Planilla_Total(Id) END 
	From Fis_Planilla
	WHERE Id = @p_Fis_Planilla_Id
	  )

	----------------------------------------------------------------------------
	-----Se obtiene el Tipo de Planilla-----------------------------------------
	Select @v_Fis_Tipo_Planilla = Tipo_Planilla
	From Fis_Planilla
	WHERE Id = @p_Fis_Planilla_Id
	 

	-----------------------------------------------------------------------------
	------------- Se obtiene la información de Fis_Planilla_Det -----------------
	insert into  #Fis_Planilla_Det
	exec dbo.Fis_Planilla_Det_Reporte_ByPlanilla
				 @p_Ver_Version_Id,
				 @p_Fis_Planilla_Id
				 

	Select @v_Incremento_Importe_1 =Sum(Incremento_Importe_1),
		   @v_Incremento_Importe_2 =Sum(Incremento_Importe_2)
           --@v_Importe_Total = Sum(Importe_Total)
	From   #Fis_Planilla_Det
		
	Drop table #Fis_Planilla_Det


	-----------------------------------------------------------------------------
	---------Se obtiene la información de Apu_Presupuesto_Cuadrilla---------------
	insert into  #Apu_Presupuesto_Cuadrilla
	exec dbo.Apu_Presupuesto_Cuadrilla_ByPlanilla
				 @p_Ver_Version_Id,
				 @v_Apu_Presupuesto_Id,
				 @p_Fis_Planilla_Id,
				 'DIS'

	Select @v_Sum_Coeficiente_DIS = Sum (Coeficiente),
		   @v_Sum_SRD_x_Coeficiente_DIS = Sum (SRD_x_Coeficiente),
		   @v_Sum_Costo_Planilla_x_Coeficiente_DIS = Sum(Costo_Planilla_x_Coeficiente),
		   @v_Fis_Catalogo_Fecha_Publicacion_1_DIS = MAX(Fis_Catalogo_Fecha_Publicacion)
	From #Apu_Presupuesto_Cuadrilla

	Delete From #Apu_Presupuesto_Cuadrilla;

	insert into  #Apu_Presupuesto_Cuadrilla
	exec dbo.Apu_Presupuesto_Cuadrilla_ByPlanilla
				 @p_Ver_Version_Id,
				 @v_Apu_Presupuesto_Id,
				 @p_Fis_Planilla_Id,
				 'REA';

	Select @v_Sum_Coeficiente_REA = Sum (Coeficiente),
		   @v_Sum_SRD_x_Coeficiente_REA = Sum (SRD_x_Coeficiente),
		   @v_Sum_Costo_Planilla_x_Coeficiente_REA = Sum(Costo_Planilla_x_Coeficiente),
		   @v_Fis_Catalogo_Fecha_Publicacion_1_REA = Max(Fis_Catalogo_Fecha_Publicacion)
	From #Apu_Presupuesto_Cuadrilla

	drop table #Apu_Presupuesto_Cuadrilla;


	-----------------------------------------------------------------------------
	---------- Se obtiene la información de Apu_Presupesto_Formula --------------
	insert into  #Apu_Presupuesto_Formula
	exec dbo.Apu_Presupuesto_Formula_ByPlanilla
				 @p_Ver_Version_Id,
				 @v_Apu_Presupuesto_Id,
				 @p_Fis_Planilla_Id,
				 'DIS'

	Select @v_Sum_Coeficiente_Formula_DIS = Sum (Coeficiente),
		   @v_Sum_Valor_Actual_DIS = Sum (Costo_Actual),
		   @v_Sum_Coeficiente_x_Relacion_DIS  = Sum (Coeficiente_x_Relacion)
	From #Apu_Presupuesto_Formula
	

	Delete From #Apu_Presupuesto_Formula;

	Insert into  #Apu_Presupuesto_Formula
	exec dbo.Apu_Presupuesto_Formula_ByPlanilla
				 @p_Ver_Version_Id,
				 @v_Apu_Presupuesto_Id,
				 @p_Fis_Planilla_Id,
				 'REA'

	Select @v_Sum_Coeficiente_Formula_REA = Sum (Coeficiente),
		   @v_Sum_Valor_Actual_REA = Sum (Costo_Actual),
		   @v_Sum_Coeficiente_x_Relacion_REA = convert(numeric(17,3),round(Sum(Coeficiente_x_Relacion),3))
	From #Apu_Presupuesto_Formula

	drop table #Apu_Presupuesto_Formula;


	------------------------------------------------------------------------------------
	---------------- Cálculos del factor de Reajuste------------------------------------

		if (@v_Fis_Tipo_Planilla = 'COS' or @v_Fis_Tipo_Planilla = 'AND')
		begin
			SET @v_Sum_Coeficiente_x_Relacion_DIS = 0.000
			SET @v_Sum_Coeficiente_x_Relacion_REA = 0.000
		end

			SET @v_Factor_Reajuste_Provisional = isnull(@v_Sum_Coeficiente_x_Relacion_DIS, 0.000);
			SET @v_Factor_Reajuste_Definitivo =  isnull(@v_Sum_Coeficiente_x_Relacion_REA, 0.000);

			SET @v_Porcentaje_Reajuste_DIS = (@v_Factor_Reajuste_Provisional - 1.00) * 100
			SET @v_Porcentaje_Reajuste_REA = (@v_Factor_Reajuste_Definitivo - 1.00)*100

	------------------------------------------------------------------------------------
	------------------------------------------------------------------------------------

	SELECT      
			Id, 
			Codigo, 
			Estado, 
			Descripcion, 
			Tipo_Planilla, 
			Apu_Presupuesto_Id, 
			Fecha_Inicio_Ingreso, 
			Fecha_Inicial, 
			Fecha_Final, 
			Fecha_Ultimo_Ingreso, 
			Porcentaje_Iva, 
			Porcentaje_Retencion, 
			Fecha_Reajuste_Provisional, 
			Fecha_Reajuste_Definitivo, 
			Numero_Planilla, 
			Descripcion_Provisional, 
			Descripcion_Definitiva, 
			Anticipo_Devengar,
			
			------------------------------------------------------------------
			--------------- Recuadro de Cálculos -----------------------------
			------------------------------------------------------------------

			-- Costo Total de la Planilla (1)
			convert(numeric(17,2),round(isnull(@v_Fis_Planilla_Total_Det,0),2)) Fis_Planilla_Total,
			


			-- Es todo lo que se ha devengado hasta la fecha, para lo cual se suma Valor_Devengar, de las planillas
			-- hasta la actual. Se utiliza en el reporte Fis_Planilla_Det
			(
				Select ISNULL(sum(Anticipo_Devengar),0)
				From Fis_Planilla FP
				Where FP.Apu_Presupuesto_Id = P.Apu_Presupuesto_Id
				And convert(int,FP.Numero_Planilla) < convert(int,P.Numero_Planilla))	
			Anticipo_Devengado,
			

			-- Valor que falta Reajustar (5)
			convert(numeric(17,2),round
			(	convert(numeric(17,2),round(isnull(@v_Fis_Planilla_Total_Det,0),2))
				-
				Anticipo_Devengar 
			,2))
			Valor_A_Reajustar,
			

			-- Valor del Iva (3)
			convert(numeric(17,2),convert(numeric(17,4),isnull(@v_Fis_Planilla_Total_Det,0) * Porcentaje_Iva / 100)) Valor_Iva,

			-- Valor de la Retención (4)
			convert(numeric(17,2),isnull(@v_Fis_Planilla_Total_Det,0) * Porcentaje_Retencion / 100) Valor_Retencion,

			-- Valor a Pagar = Total - Anticipos + Iva - Retención (14)
			Convert(numeric(17,2),round((isnull(@v_Fis_Planilla_Total_Det,0)
			-
			Anticipo_Devengar
			+
			convert(numeric(17,2),isnull(@v_Fis_Planilla_Total_Det,0) * Porcentaje_Iva / 100)
			-
			convert(numeric(17,2),isnull(@v_Fis_Planilla_Total_Det,0) * Porcentaje_Retencion / 100)),2)) Valor_A_Pagar,

			-------------------------------------------------------------------------------------
			-------------------- Recuadro Provisional -------------------------------------------
			-------------------------------------------------------------------------------------
			
			-- Factor del Reajuste Provisional (6)
			@v_Factor_Reajuste_Provisional  Factor_Reajuste_Provisional,
			
			-- Valor del Reajuste Provisional = Valor a Reajustar * Factor Reajuste Provisional (7)
			convert(numeric(17,2),round((isnull(@v_Fis_Planilla_Total_Det,0)
			-
			Anticipo_Devengar)
			*
			@v_Factor_Reajuste_Provisional,2)) Valor_Reajuste_Provisional,

			-- Valor del Iva en base al Reajuste Provisional = Procentaje_Iva * Valor Reajuste Provisional (8)
			dbo.Fis_Planilla_Valor_Iva
				(@v_Fis_Planilla_Total_Det,
				 Anticipo_Devengar,
				 @v_Factor_Reajuste_Provisional,
				 Porcentaje_Iva)	 Valor_Iva_Provisional,


			-- Valor de la Retención en base al Reajuste Provisional = Porcentaje Retencion * Valor Reajuste Provisional (9)
			convert(numeric(17,2),round((
				-- Inicio
				(convert(numeric(17,2),
						round(
							(isnull
								(@v_Fis_Planilla_Total_Det,0)
								-
								Anticipo_Devengar
							)
							*
							@v_Factor_Reajuste_Provisional
						,2)
				)
				-
						(isnull
						(@v_Fis_Planilla_Total_Det,0)
						-
						Anticipo_Devengar
						)
				)
				-- Fin
			* 
			Porcentaje_Retencion /100),2)) Valor_Retencion_Provisional,

			
			-----------------------------------------------------------------------------------------------
			-- Valor_A_Pagar_Provisional =
			-- Valor_Del_Reajuste_Provisional + Valor_Iva_Provisional - Valor_Retencion_Provisional (15)
			-----------------------------------------------------------------------------------------------
			(
				(convert(numeric(17,2),round((isnull(@v_Fis_Planilla_Total_Det,0)
				-
				Anticipo_Devengar)
				*
				@v_Factor_Reajuste_Provisional,2)))
				-
				(
					isnull(@v_Fis_Planilla_Total_Det,0)
					-
					Anticipo_Devengar
				)
			)
			+
				-- Valor del Iva Provisional
				dbo.Fis_Planilla_Valor_Iva
				(@v_Fis_Planilla_Total_Det,
				 Anticipo_Devengar,
				 @v_Factor_Reajuste_Provisional,
				 Porcentaje_Iva)
			-
			(
				convert(numeric(17,2),round((
				-- Inicio
				(convert(numeric(17,2),
						round(
							(isnull
								(@v_Fis_Planilla_Total_Det,0)
								-
								Anticipo_Devengar
							)
							*
							@v_Factor_Reajuste_Provisional
						,2)
				)
				-
						(isnull
						(@v_Fis_Planilla_Total_Det,0)
						-
						Anticipo_Devengar
						)
				)
				-- Fin
				* 
				Porcentaje_Retencion /100),2))
			)
			Valor_A_Pagar_Provisional,
			

			-------------------------------------------------------------------------------------
			-------------------- Recuadro Definitivo  -------------------------------------------
			-------------------------------------------------------------------------------------
			
			-- Factor del Reajuste Definitivo (6)
			@v_Factor_Reajuste_Definitivo  Factor_Reajuste_Definitivo,
			
			-- Valor del Reajuste Definitivo = Valor a Reajustar * Factor Reajuste Definitivo (7)
			convert(numeric(17,2),round((isnull(@v_Fis_Planilla_Total_Det,0)
			-
			Anticipo_Devengar)
			*
			@v_Factor_Reajuste_Definitivo,2)) Valor_Reajuste_Definitivo,


			-- Valor del Iva en base al Reajuste Definitivo = Procentaje_Iva * Valor Reajuste Definitivo (8)
			dbo.Fis_Planilla_Valor_Iva
				(@v_Fis_Planilla_Total_Det,
				 Anticipo_Devengar,
				 @v_Factor_Reajuste_Definitivo,
				 Porcentaje_Iva) Valor_Iva_Definitivo,


		-- Valor de la Retención = Porcentaje Retencion * Valor Reajuste Definitivo (9)
			convert(numeric(17,2),round((
				-- Inicio
				(convert(numeric(17,2),
						round(
							(isnull
								(@v_Fis_Planilla_Total_Det,0)
								-
								Anticipo_Devengar
							)
							*
							@v_Factor_Reajuste_Definitivo
						,2)
				)
				-
						(isnull
						(@v_Fis_Planilla_Total_Det,0)
						-
						Anticipo_Devengar
						)
				)
				-- Fin
			* 
			Porcentaje_Retencion /100),2))	Valor_Retencion_Definitivo,


			
			--- Valor a Pagar Definitivo = Valor de Reajuste Definitivo + Iva Definitivo - Retención Definitivo (15)
			-- Valor_A_Pagar_Definitivo = Valor_Del_Reajuste_Definitivo + Valor_Iva_Definitivo - Valor_Retencion_Definitivo 
			(
				(convert(numeric(17,2),round((isnull(@v_Fis_Planilla_Total_Det,0)
				-	
				Anticipo_Devengar)
				*
				@v_Factor_Reajuste_Definitivo,2)))
				-
				isnull(@v_Fis_Planilla_Total_Det,0)
			)			
			+
			-- Inicio del Iva
			dbo.Fis_Planilla_Valor_Iva
				(@v_Fis_Planilla_Total_Det,
				 Anticipo_Devengar,
				 @v_Factor_Reajuste_Definitivo,
				 Porcentaje_Iva)
			 -- Fin Iva	
			-
			(
				-- Inicio de Retencion
				convert(numeric(17,2),round((
				-- Inicio
				(convert(numeric(17,2),
						round(
							(isnull
								(@v_Fis_Planilla_Total_Det,0)
								-
								Anticipo_Devengar
							)
							*
							@v_Factor_Reajuste_Definitivo
						,2)
				)
				-
						(isnull
						(@v_Fis_Planilla_Total_Det,0)
						-
						Anticipo_Devengar
						)
				)
				-- Fin
				* 
				Porcentaje_Retencion /100),2))
				-- Fin de la Retención
			)
			Valor_A_Pagar_Definitivo,

			
			-----------------------------------------------------------------------------------------------------
			---------------------- Datos del Recuadro de Fechas -------------------------------------------------
			Datediff (day,Fecha_Inicial, Fecha_Final)		Numero_Dias_Periodo,
			
			--Son los días acumulados hasta la planilla_actual
			(Select sum(Datediff (day,Fecha_Inicial, Fecha_Final))
			 From Fis_Planilla FP
			 Where FP.Apu_Presupuesto_Id = @v_Apu_Presupuesto_Id
			 And convert(int,FP.Numero_Planilla) <= convert(int,P.Numero_Planilla))		Numero_Dias_Acumulado,
			

			dbo.Fis_Catalogo_Nombre(Provisional_Fis_Catalogo_Id) Publicacion_Reajuste_Provisional,
			dbo.Fis_Catalogo_Nombre(Definitivo_Fis_Catalogo_Id) Publicacion_Reajuste_Definitivo,
			
			------------------------- Datos para el reporte de REAJUSTE DE PRECIOS-------------------------------
			-----------------------------------------------------------------------------------------------------
			@v_Contratista_Per_Personal_Nombre Contratista_Per_Personal_Nombre,
					
			@v_Contratista_Per_Personal_Id Contratista_Per_Personal_Id,

			@v_Apu_Presupuesto_Costo_Total Apu_Presupuesto_Costo_Total,

			ISNULL(@v_Anticipo_Porcentaje,0) Apu_Presupuesto_Anticipo_Porcentaje,

			ISNULL(@v_Fecha_Oferta_Cierre,getdate()) Apu_Presupuesto_Fecha_Oferta_Cierre,
		
			Year (Fecha_Inicial) Fis_Planilla_Anio,

			getDate()   Apu_Presupuesto_Fecha_Pago,

			----------------------- Campos por el reporte de Reajuste de precios -------------------
			----------------------------------------------------------------------------------------

		isnull(@v_Sum_Coeficiente_DIS,0) Sum_Coeficiente_DIS,
		isnull(@v_Sum_Coeficiente_REA,0)  Sum_Coeficiente_REA,
		isnull(@v_Sum_SRD_x_Coeficiente_DIS,0) Sum_SRD_x_Coeficiente_DIS,
		isnull(@v_Sum_SRD_x_Coeficiente_REA,0) Sum_SRD_x_Coeficiente_REA,
		isnull(@v_Sum_Costo_Planilla_x_Coeficiente_DIS,0) Sum_Costo_Planilla_x_Coeficiente_DIS,
		isnull(@v_Sum_Costo_Planilla_x_Coeficiente_REA,0) Sum_Costo_Planilla_x_Coeficiente_REA,

		isnull(@v_Sum_Coeficiente_Formula_DIS,0)		Sum_Coeficiente_Formula_DIS,
		isnull(@v_Sum_Valor_Actual_DIS,0)				Sum_Valor_Actual_DIS,
		isnull(@v_Sum_Coeficiente_x_Relacion_DIS,0.000)		Sum_Coeficiente_x_Relacion_DIS,
		isnull(@v_Sum_Coeficiente_Formula_REA,0)		Sum_Coeficiente_Formula_REA,
		isnull(@v_Sum_Valor_Actual_REA,0)				Sum_Valor_Actual_REA,
		isnull(@v_Sum_Coeficiente_x_Relacion_REA,0.000)		Sum_Coeficiente_x_Relacion_REA,

		isnull(@v_Porcentaje_Reajuste_DIS,0.00)			Porcentaje_Reajuste_DIS,
		isnull(@v_Porcentaje_Reajuste_REA,0.0)			Porcentaje_Reajuste_REA,


		----------------------------------------------------------------------------------------
		-- Valor_Del_Reajuste_Provisional = Valor_Reajuste_Provisional - Valor_A_Reajustar
		----------------------------------------------------------------------------------------
			(convert(numeric(17,2),round((isnull(@v_Fis_Planilla_Total_Det,0)
			-
			Anticipo_Devengar)
			*
			@v_Factor_Reajuste_Provisional,2)))
			-
			(
				isnull(@v_Fis_Planilla_Total_Det,0)
				-
				Anticipo_Devengar
			)				
		Valor_Del_Reajuste_Provisional,



		-- Valor_Del_Reajuste_Definitivo = Valor_Reajuste_Provisional - Valor_A_Reajustar
			(convert(numeric(17,2),round((isnull(@v_Fis_Planilla_Total_Det,0)
			-
			Anticipo_Devengar)
			*
			@v_Factor_Reajuste_Definitivo,2)))
			-
			isnull(@v_Fis_Planilla_Total_Det,0)  Valor_Del_Reajuste_Definitivo,

		------------------------------------------------------------------------------------------
		---------------- Información para el Reporte de Detalles de Planillas --------------------

		--Suma de los Importes de las planillas anteriores a la actual
		Isnull(convert(numeric(17,2),Round((Select Sum(FPD.Costo * FPD.Cantidad)
		From Fis_Planilla_Det FPD
		Where dbo.Fis_Planilla_Apu_Presupuesto_Id(P.Id)=
		       dbo.Fis_Planilla_Apu_Presupuesto_Id(FPD.Fis_Planilla_Id)
		And 
			convert(int,dbo.Fis_Planilla_Numero_Planilla(FPD.Fis_Planilla_Id)) 
			< 
			convert(int,dbo.Fis_Planilla_Numero_Planilla(P.Id))
			),2)),0.00)		
		Sum_Importe_Anterior,

		


		--------------------------------------------------------------------------
					------- Importe Anterior total de anticipo ---------
		--------------------------------------------------------------------------
		
		(
			Select ISNULL(sum( convert(numeric(17,2),round(Anticipo_Devengar,2))),0)
			From Fis_Planilla FP
			Where FP.Apu_Presupuesto_Id = P.Apu_Presupuesto_Id
			And convert(int,FP.Numero_Planilla) < convert(int,P.Numero_Planilla)
		)
		
		Sum_Importe_Anterior_Anticipo,



		-----------------------------------------------------------------------------
		----- Calculo del Iva de los valores anteriores a la planila actual  -------
		-----------------------------------------------------------------------------
		(
			convert(numeric(17,2),round(
			(
			--Inicio
			Isnull(convert(numeric(17,2),Round((Select ISNULL(Sum(FPD.Costo * FPD.Cantidad),0)
			From Fis_Planilla_Det FPD
			Where dbo.Fis_Planilla_Apu_Presupuesto_Id(P.Id)=
	        dbo.Fis_Planilla_Apu_Presupuesto_Id(FPD.Fis_Planilla_Id)
			And 
			convert(int,dbo.Fis_Planilla_Numero_Planilla(FPD.Fis_Planilla_Id)) 
			< 
			convert(int,dbo.Fis_Planilla_Numero_Planilla(P.Id))
			),2)),0.00)	
			--Fin
			)
			*
			Porcentaje_Iva
			/100,2))		
		)	
		Sum_Importe_Anterior_Iva,


		------------------------------------------------------------------------------------------
		--Importe Anterior Deducciones = Valor de de anticipos Anteriores + Valor Iva Anterioeres
		------------------------------------------------------------------------------------------
		(
				Select ISNULL(convert(numeric(17,2),round( sum(Anticipo_Devengar),2)),0)
				From Fis_Planilla FP
				Where FP.Apu_Presupuesto_Id = P.Apu_Presupuesto_Id
				And convert(int,FP.Numero_Planilla) < convert(int,P.Numero_Planilla)
		)		
		+
		(
				Select  ISNULL( convert(numeric(17,2),round( sum(isnull(@v_Fis_Planilla_Total_Det,0) * Porcentaje_Iva / 100),2)),0)
				From Fis_Planilla FP
				Where FP.Apu_Presupuesto_Id = P.Apu_Presupuesto_Id
				And convert(int,FP.Numero_Planilla) < convert(int,P.Numero_Planilla)
		)
		Sum_Importe_Anterior_Deducciones,


		-------------------------------------------------------------------------------------------------
		--Importe Anterior a Pagar = Importe de las planillas anteriores + Iva - Retenciones
		-------------------------------------------------------------------------------------------------
		(
			-- Sumatoria de planillas anteriores
		Isnull(convert(numeric(17,2),Round((Select Sum(FPD.Costo * FPD.Cantidad)
		From Fis_Planilla_Det FPD
		Where dbo.Fis_Planilla_Apu_Presupuesto_Id(P.Id)=
		       dbo.Fis_Planilla_Apu_Presupuesto_Id(FPD.Fis_Planilla_Id)
		And 
		convert(int,dbo.Fis_Planilla_Numero_Planilla(FPD.Fis_Planilla_Id)) 
		< 
		convert(int,dbo.Fis_Planilla_Numero_Planilla(P.Id))
		),2)),0.00)		
		)
		+
		-- Valor del Porcentaje del Iva
		(
			convert(numeric(17,2),round(
			(
			--Inicio
			Isnull(convert(numeric(17,2),Round((Select ISNULL(Sum(FPD.Costo * FPD.Cantidad),0)
			From Fis_Planilla_Det FPD
			Where dbo.Fis_Planilla_Apu_Presupuesto_Id(P.Id)=
	        dbo.Fis_Planilla_Apu_Presupuesto_Id(FPD.Fis_Planilla_Id)
			And 
			convert(int,dbo.Fis_Planilla_Numero_Planilla(FPD.Fis_Planilla_Id)) 
			< 
			convert(int,dbo.Fis_Planilla_Numero_Planilla(P.Id))
			),2)),0.00)	
			--Fin
			)
			*
			Porcentaje_Iva
			/100,2))		
		)	
		Sum_Importe_Anterior_Pagar,


		-- Importe Total Actual a Pagar
		isnull(convert(numeric(17,2),round( @v_Fis_Planilla_Total_Det,2)),0)			
		Sum_Importe_Actual,


		-- Anticipo Actual a Devengar
		isnull(convert(numeric(17,2),round( Anticipo_Devengar,2)), 0.00)				
		Sum_Importe_Actual_Anticipo,


		--Es el valor actual del Iva
		(
		  	convert(numeric(17,2),round(( isnull(@v_Fis_Planilla_Total_Det,0)
			*
			Porcentaje_Iva /100),2))
		)
		Sum_Importe_Actual_Iva,


		-- Importe Total Deducciones Actual = es igual a Anticipo Devengado + Valor de Iva
		(
			convert(numeric(17,2),round( isnull(Anticipo_Devengar, 0.00),2))
		)
		+
		(
			convert(numeric(17,2), round((  isnull(@v_Fis_Planilla_Total_Det,0)
			*
			Porcentaje_Iva
			/
			100),2))
		)
		Sum_Importe_Actual_Deducciones,



		-- Es el valor total a pagar = Sum_Importe_Actual 
		-- - Sum_Importe_Actual_Anticipo + Sum_Importe_Actual_Iva
		convert( numeric(17,2),round ( (
		(
		 	isnull(convert(numeric(17,2),round( @v_Fis_Planilla_Total_Det,2)),0)
		)
		+
		(
			--Inicio del Iva
		  	convert(numeric(17,2),round(( isnull(@v_Fis_Planilla_Total_Det,0)
			*
			Porcentaje_Iva /100),2))
			--Fin del Iva
		)

		),2)) 
		Sum_Importe_Actual_Pagar,


		--------------------------------------------------------------------------------------------------
		-- Este campo también se utiliza para presnetar en el campo MONTO ACUMULADO
		-- en la página FIS_PLANILLA_RESUMEN
		-- Importe Total = Cantidad * Costo, hasta la Planilla Actual
		-- Monto Acumulado: La Suma del monto de las planillas anteriores incluendo a la actual.
		--------------------------------------------------------------------------------------------------
		Isnull(convert(numeric(17,2),Round((Select Sum(FPD.Costo * FPD.Cantidad)
		From Fis_Planilla_Det FPD
		Where dbo.Fis_Planilla_Apu_Presupuesto_Id(P.Id)=
		       dbo.Fis_Planilla_Apu_Presupuesto_Id(FPD.Fis_Planilla_Id)
		And 
			convert(int,dbo.Fis_Planilla_Numero_Planilla(FPD.Fis_Planilla_Id)) 
			< =
			convert(int,dbo.Fis_Planilla_Numero_Planilla(P.Id))
			),2)),0.00) 
		Sum_Importe_Total,


		-- Total de todos los anticipos devengados hasta la planilla actual
		(
				Select  isnull(convert(numeric(17,2),round( sum(Anticipo_Devengar),2)),0)
				From Fis_Planilla FP
				Where FP.Apu_Presupuesto_Id = P.Apu_Presupuesto_Id
				And convert(int,FP.Numero_Planilla) <= convert(int,P.Numero_Planilla)
		)	Sum_Importe_Total_Anticipo,

		
		-- Es el valor total del Iva, hasta la plamilla actual
		convert(numeric(17,2),round(  (
				Select sum(isnull(@v_Fis_Planilla_Total_Det,0) * Porcentaje_Iva /100)
				From Fis_Planilla FP
				Where FP.Apu_Presupuesto_Id = P.Apu_Presupuesto_Id
				And convert(int,FP.Numero_Planilla) <= convert(int,P.Numero_Planilla)
		),2))	
		Sum_Importe_Total_Iva,


		--Importe Total de Deducciones = Total Anticipos devengados hasta la planilla actual + 
		--Total Iva hasta la planilla actual
		convert(numeric(17,2),round
		((
		(
				Select sum(Anticipo_Devengar)
				From Fis_Planilla FP
				Where FP.Apu_Presupuesto_Id = P.Apu_Presupuesto_Id
				And convert(int,FP.Numero_Planilla) <= convert(int,P.Numero_Planilla)
		)		
		+
		(
				Select sum(isnull(@v_Fis_Planilla_Total_Det,0) * Porcentaje_Iva /100)
				From Fis_Planilla FP
				Where FP.Apu_Presupuesto_Id = P.Apu_Presupuesto_Id
				And convert(int,FP.Numero_Planilla) <= convert(int,P.Numero_Planilla)
		)),2))		
		Sum_Importe_Total_Deducciones,


		------------------------------------------------------------------------------------------
		------Total a Pagar = Valor Actual hasta la planilla actual - anticipos + iva-------------
		------------------------------------------------------------------------------------------
		convert(numeric(17,2) , round(
		(
			Isnull(convert(numeric(17,2),Round((Select Sum(FPD.Costo * FPD.Cantidad)
			From Fis_Planilla_Det FPD
			Where dbo.Fis_Planilla_Apu_Presupuesto_Id(P.Id)=
		       dbo.Fis_Planilla_Apu_Presupuesto_Id(FPD.Fis_Planilla_Id)
			And 
				convert(int,dbo.Fis_Planilla_Numero_Planilla(FPD.Fis_Planilla_Id)) 
				< =
				convert(int,dbo.Fis_Planilla_Numero_Planilla(P.Id))
				),2)),0.00)
		)		
		+
		(
			Select sum(isnull(@v_Fis_Planilla_Total_Det,0) * Porcentaje_Iva /100)
			From Fis_Planilla FP
			Where FP.Apu_Presupuesto_Id = P.Apu_Presupuesto_Id
			And convert(int,FP.Numero_Planilla) <= convert(int,P.Numero_Planilla)
		)		
		
		,2))
		Sum_Importe_Total_Pagar,
		

		-- Suma de Fis_Planilla_Det, de Incremento_Importe_1,		
		@v_Incremento_Importe_1 Sum_Incremento_Monto_1,

		-- Suma de Fis_Planilla_Det, de Incremento_Importe_2,		
		@v_Incremento_Importe_2	Sum_Incremento_Monto_2,

		-----------------------------------------------------------------------------------
		------------- Campos para la página Fis_Planilla_Resumen --------------------------
		--% de incremente: (Monto Acumulado - Monto del Contrato) / Monto del Contrato * 100
		-- Este campo se presenta en Fis_Planilla_Resumen. se llama % DE INCREMENTO

		Convert(Numeric(5,2),Round(
		(
			(
				Isnull(convert(numeric(17,2),Round((Select Sum(FPD.Costo * FPD.Cantidad)
				From Fis_Planilla_Det FPD
				Where dbo.Fis_Planilla_Apu_Presupuesto_Id(P.Id)=
					dbo.Fis_Planilla_Apu_Presupuesto_Id(FPD.Fis_Planilla_Id)
				And 
					convert(int,dbo.Fis_Planilla_Numero_Planilla(FPD.Fis_Planilla_Id)) 
					< =
					convert(int,dbo.Fis_Planilla_Numero_Planilla(P.Id))
					),2)),0.00)
			)
			-
			(
				@v_Apu_Presupuesto_Costo_Total
			)
		)
		/
		(
			@v_Apu_Presupuesto_Costo_Total
		)
		* 100
		,2))	Porcentaje_Incremento,


		--Total Planillas C+%: La suma del monto de las planillas del tipo Costo + % incluyendo a la actual.
		-- Este campo se presenta en Fis_Planilla_Resumen. se llama TOTAL PLANILLAS COSTO+%
		Isnull(convert(numeric(17,2),Round((
		Select Sum(FPD.Costo * FPD.Cantidad)
		From Fis_Planilla_Det FPD
		Where dbo.Fis_Planilla_Apu_Presupuesto_Id(P.Id)=
		              dbo.Fis_Planilla_Apu_Presupuesto_Id(FPD.Fis_Planilla_Id)
				And dbo.Fis_Planilla_Tipo_Planilla(FPD.Fis_Planilla_Id) = 'COS'
				And convert(int,dbo.Fis_Planilla_Numero_Planilla(FPD.Fis_Planilla_Id)) 
					< =
					convert(int,dbo.Fis_Planilla_Numero_Planilla(P.Id))
			),2)),0.00)  Total_Costo_Mas_Porcentaje,



		-- % de C + %  = (Total Planillas C+%) / Monto del Contrato * 100
		-- Este campo se presenta en Fis_Planilla_Resumen. se llama %C+%		
		Isnull(convert(numeric(5,2),Round(
		(		
			(
				Isnull(convert(numeric(17,2),Round((Select Sum(FPD.Costo * FPD.Cantidad)
				From Fis_Planilla_Det FPD
				Where dbo.Fis_Planilla_Apu_Presupuesto_Id(P.Id)=
		              dbo.Fis_Planilla_Apu_Presupuesto_Id(FPD.Fis_Planilla_Id)
				And dbo.Fis_Planilla_Tipo_Planilla(FPD.Fis_Planilla_Id) = 'COS'
				And convert(int,dbo.Fis_Planilla_Numero_Planilla(FPD.Fis_Planilla_Id)) 
					< =
					convert(int,dbo.Fis_Planilla_Numero_Planilla(P.Id))
					),2)),0.00)
			)
		)
		/
		(
				@v_Apu_Presupuesto_Costo_Total
		)
		*
		100
		,2)),0.00) Porcentaje_Costo_Mas_Porcentaje,

		Convert (numeric(17,2),0) Deduccion_Acumulada,
		Convert (numeric(17,2),0) Saldo,

	-- Campos para el reporte de PLANILLAS DEL FISCALIZADOR
	-- En el Reporte el campo se llama INCREMENTO CANTIDAD
	Isnull(convert(numeric(17,2),Round((Select Sum(FPD.Cantidad)
	From Fis_Planilla_Det FPD
	Where dbo.Fis_Planilla_Apu_Presupuesto_Id(P.Id)=
		       dbo.Fis_Planilla_Apu_Presupuesto_Id(FPD.Fis_Planilla_Id)
		And 
			convert(int,dbo.Fis_Planilla_Numero_Planilla(FPD.Fis_Planilla_Id)) 
			< =
			convert(int,dbo.Fis_Planilla_Numero_Planilla(P.Id))
			),2)),0.00) Sum_Cantidad_Total,


	-- Monto Total a Ejecutarse = Monto del Contrato + Incremento Cantidad
	-- Este campo es utilizado en el repote de PLANILLAS DEL FISCALIZADOR
	-- El campo se llama MONTO TOTAL A EJECUTARSE
	(
		@v_Apu_Presupuesto_Costo_Total
	)
	+
	(
		Isnull(convert(numeric(17,2),Round((Select Sum(FPD.Cantidad * FPD.Costo)
		From Fis_Planilla_Det FPD
		Where dbo.Fis_Planilla_Apu_Presupuesto_Id(P.Id)=
		       dbo.Fis_Planilla_Apu_Presupuesto_Id(FPD.Fis_Planilla_Id)
		And 
			convert(int,dbo.Fis_Planilla_Numero_Planilla(FPD.Fis_Planilla_Id)) 
			< =
			convert(int,dbo.Fis_Planilla_Numero_Planilla(P.Id))
			),2)),0.00)

	) Monto_Total_Ejecutarse,

	ISNULL(@v_Fecha_Contrato_Firma,getdate()) Fecha_Ini_Contrato,

	-- Anticipo que falta Devengar = Anticipo - Anticipo Devengado hasta la fecha)
		(
			@p_Anticipo_Valor
		)
		-
		(
			Select  isnull(convert(numeric(17,2),round( sum(Anticipo_Devengar),2)),0)
			From Fis_Planilla FP
			Where FP.Apu_Presupuesto_Id = P.Apu_Presupuesto_Id
			And convert(int,FP.Numero_Planilla) <= convert(int,P.Numero_Planilla)
		)
		Anticipo_por_Devengar ,

	-- Este campo sirve para Fis_Planilla_Det_Resumen. La etiqueta es Monto_Total (USD)
	-- Monto Total = Monto del Contrato + Incremento
	convert(numeric(17,2),round(@v_Apu_Presupuesto_Costo_Total + @v_Incremento_Importe_2,2)) Monto_Total,

	--	 Fecha Publicacion del INDICE Cero
		isnull(@v_Fis_Catalogo_Fecha_Publicacion_0,getdate()) Fis_Catalogo_Fecha_Publicacion_0,

	--	 Fecha Publicacion del INDICE UNO DIS
		isnull(@v_Fis_Catalogo_Fecha_Publicacion_1_DIS,getdate()) Fis_Catalogo_Fecha_Publicacion_1_DIS,

	-- Fecha de Publicacion INDICE UNO REA
		isnull(@v_Fis_Catalogo_Fecha_Publicacion_1_REA,getdate()) Fis_Catalogo_Fecha_Publicacion_1_REA,

	-- Incremento Real de la Obra (Este campo se presneta en Fis_Planilla_Fiscalizador)
	-- Incremento Real de la obra = Valor_Acumuldo en planillas / Monto del Contrato
	
	ISNULL( ((	Isnull(convert(numeric(17,2),Round((Select Sum(FPD.Costo * FPD.Cantidad)
		From Fis_Planilla_Det FPD
		Where dbo.Fis_Planilla_Apu_Presupuesto_Id(P.Id)=
		       dbo.Fis_Planilla_Apu_Presupuesto_Id(FPD.Fis_Planilla_Id)
		And 
			convert(int,dbo.Fis_Planilla_Numero_Planilla(FPD.Fis_Planilla_Id)) 
			< =
			convert(int,dbo.Fis_Planilla_Numero_Planilla(P.Id))
			),2)),0.00) 
	)
	/
	@v_Apu_Presupuesto_Costo_Total),0)  Incremento_Real_Obra
		
	

	FROM Fis_Planilla P
	WHERE Id = @p_Fis_Planilla_Id


END

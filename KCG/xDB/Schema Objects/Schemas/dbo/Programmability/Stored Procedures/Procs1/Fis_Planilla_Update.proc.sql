CREATE PROCEDURE [dbo].[Fis_Planilla_Update]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Estado char(3),
	@Descripcion varchar(2000),
	@Tipo_Planilla char(3),
	@Apu_Presupuesto_Id varchar(17),
	@Fecha_Inicio_Ingreso smalldatetime,
	@Fecha_Inicial smalldatetime,
	@Fecha_Final smalldatetime,
	@Fecha_Ultimo_Ingreso smalldatetime,
	@Porcentaje_Iva numeric(5, 2),
	@Porcentaje_Retencion numeric(5, 2),
	@Fecha_Reajuste_Provisional smalldatetime,
	@Fecha_Reajuste_Definitivo smalldatetime,
	@Numero_Planilla varchar(50),
	@Descripcion_Provisional varchar(2000),
	@Descripcion_Definitiva varchar(2000),
	@Anticipo_Devengar numeric(17, 4),
	@Provisional_Fis_Catalogo_Id varchar(17),
	@Definitivo_Fis_Catalogo_Id varchar(17),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000),
	@Original_Tipo_Planilla char(3),
	@Original_Apu_Presupuesto_Id varchar(17),
	@Original_Fecha_Inicio_Ingreso smalldatetime,
	@Original_Fecha_Inicial smalldatetime,
	@Original_Fecha_Final smalldatetime,
	@Original_Fecha_Ultimo_Ingreso smalldatetime,
	@Original_Porcentaje_Iva numeric(5, 2),
	@Original_Porcentaje_Retencion numeric(5, 2),
	@Original_Fecha_Reajuste_Provisional smalldatetime,
	@Original_Fecha_Reajuste_Definitivo smalldatetime,
	@Original_Numero_Planilla varchar(50),
	@IsNull_Descripcion_Provisional Int,
	@Original_Descripcion_Provisional varchar(2000),
	@IsNull_Descripcion_Definitiva Int,
	@Original_Descripcion_Definitiva varchar(2000),
	@Original_Anticipo_Devengar numeric(17, 4),
	@IsNull_Provisional_Fis_Catalogo_Id Int,
	@Original_Provisional_Fis_Catalogo_Id varchar(17),
	@IsNull_Definitivo_Fis_Catalogo_Id Int,
	@Original_Definitivo_Fis_Catalogo_Id varchar(17)
)
AS
	SET NOCOUNT OFF;

DECLARE  @v_mensaje varchar(10),
	@p_resultado_Anticipo varchar(200),
    @p_Tipo_Error varchar(1),

--Variables para el Cálculo del Anticipo a Devengar
	@p_Apu_Origen_Id varchar(17)  ,
	@p_Origen char(3) ,
	@p_Costo_Total numeric(17, 4) ,

	@p_Codigo_Institucional varchar(200),
	@p_Anticipo_Porcentaje numeric(5,2) ,

	@p_Anticipo_Valor numeric(17,2),
	@p_Anticipo_Devengado numeric(17,2),
	@p_Total_Planilla numeric(17,2),
	@p_Maximo_Devengar_Planilla numeric(17,2),
	@p_Anticipo_Valido_Devenga numeric(17,2),
    @p_Anticipo_Devengar_Ingresado numeric(17,2),
    @p_Tipo_Transaccion varchar(1),
	@Tipo_Planilla_Nombre varchar(50)

-- Se crea lac tabla temporal
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


--La primera planilla debe ser del tipo Anticipo
	IF ( @Tipo_Planilla <>'ANT' and dbo.Fis_Planilla_Nro_Planillas_Anticipo(@Apu_Presupuesto_Id,'ANT')=0)
		Begin
				SET @v_mensaje = 'MSJ109';
				RAISERROR (N'%s', -- Message text.
						   12, -- Severity,
						   1, -- State,
						   @v_mensaje, -- First argument.
						   1); -- Second argument.
				RETURN
		End

	--Solo se puede insertar una planilla de tipo ANT o Anticipo
	IF (@Original_Tipo_Planilla<>@Tipo_Planilla AND (@Tipo_Planilla ='ANT' or @Tipo_Planilla ='AND')  and dbo.Fis_Planilla_Nro_Planillas_Anticipo(@Apu_Presupuesto_Id,@Tipo_Planilla)>0)
		Begin
		Select @Tipo_Planilla_Nombre= dbo.Dominio('FIS_PLANILLA','Tipo_Planilla',@Tipo_Planilla,1) 
				SET @v_mensaje = 'MSJ104';
				RAISERROR (N'%s|%s', -- Message text.
						   12, -- Severity,
						   1, -- State,
						   @v_mensaje, -- First argument.
						   @Tipo_Planilla_Nombre); -- Second argument.
				RETURN
		End


	--Se realiza la validacion solo si se quiere insertar un valor mayor a 0 en Anticipo_Devengar
	if (@Anticipo_Devengar>0 AND @Tipo_Planilla<>'ANT' )
    BEGIN

	-- Proceso para Obtener el Anticipo a Devengar deacuerdo al Codigo Institucional.
		Set @p_Anticipo_Devengar_Ingresado = 	@Anticipo_Devengar
		Set @p_Tipo_Transaccion='U'


	--Obtener la informacion de Apu_Presupuesto
			Select	@p_Apu_Origen_Id = Apu_Origen_Id ,
					@p_Origen =Origen  ,
					@p_Costo_Total = Costo_Total 
			from Apu_Presupuesto
			where Id=@Apu_Presupuesto_Id

			Set @p_Codigo_Institucional = dbo._Apu_Presupuesto_Codigo_Institucional(@p_Origen, @p_Apu_Origen_Id)

		--Obtener la información de Contratos para insertar el Presupuesto
		insert into  #Apu_Presupuesto_Temporal
		exec dbo.Int_Contrato_ByCodigo_Institucional @p_Codigo_Institucional;

		Select 	@p_Anticipo_Porcentaje   = Anticipo_Porcentaje
		From #Apu_Presupuesto_Temporal
		Where Codigo_Institucional = @p_Codigo_Institucional

		Set @p_Anticipo_Valor=ISNULL(((@p_Costo_Total * @p_Anticipo_Porcentaje)/100),0.00)

		IF (@Tipo_Planilla='ANT')
			BEGIN
				Set @p_Anticipo_Valor= 0
				Set @p_resultado_Anticipo= 'A'+ Cast(@p_Anticipo_Valor as varchar)
			END
		ELSE
		BEGIN
			Set @p_Total_Planilla = dbo.Fis_Planilla_Total (@Id)
			
			--Si se va a Actualizar no se toma en cuenta el valor anterior de la planilla
			Set @p_Anticipo_Devengado =  dbo.Fis_Planilla_Anticipo_Devengado(@Apu_Presupuesto_Id,@p_Tipo_Transaccion,@Id)
			Set @p_Anticipo_Valido_Devenga=@p_Anticipo_Valor-@p_Anticipo_Devengado
	
			IF (@Tipo_Planilla='AND')
				Set @p_Maximo_Devengar_Planilla=@p_Anticipo_Devengar_Ingresado
			ELSE
					Set @p_Maximo_Devengar_Planilla =  ISNULL(((@p_Total_Planilla * @p_Anticipo_Porcentaje)/100),0.00)
			-- Se valida si el anticipo a ingresar es menor en primer lugar al maximo permitido por planilla
			if (@p_Anticipo_Devengar_Ingresado <=@p_Maximo_Devengar_Planilla)
				Begin
				if (@p_Anticipo_Devengar_Ingresado>@p_Anticipo_Valido_Devenga)
					Set @p_resultado_Anticipo= 'V' + Cast(@p_Anticipo_Valido_Devenga  as varchar)
				else
					Set @p_resultado_Anticipo='C'
				end
			else 
			    Set	@p_resultado_Anticipo='P'+ Cast( @p_Maximo_Devengar_Planilla  as varchar)
			
			
		END


		Set @p_Tipo_Error = SUBSTRING(@p_resultado_Anticipo,1,1)
		Set @p_resultado_Anticipo = SUBSTRING(@p_resultado_Anticipo,2,200)
		
		IF (@p_Tipo_Error<>'C')
		BEGIN
			IF (@p_Tipo_Error='V')
					SET @v_mensaje = 'MSJ103';
			ELSE
					SET @v_mensaje = 'MSJ105';
			
			RAISERROR (N'%s|%s', -- Message text.
					   12, -- Severity,
					   1, -- State,
					   @v_mensaje, -- First argument.
					   @p_resultado_Anticipo); -- Second argument.
			RETURN
		END
	END	

if @Fecha_Reajuste_Provisional<>@Original_Fecha_Reajuste_Provisional 
		Set @Provisional_Fis_Catalogo_Id =
						(Select Id
						  From Fis_Catalogo
						  Where Fecha_Publicacion =
  						     (Select Max(Fecha_Publicacion) From Fis_Catalogo
							  Where Fecha_Publicacion <=@Fecha_Reajuste_Provisional))

if @Fecha_Reajuste_Definitivo<>@Original_Fecha_Reajuste_Definitivo
		Set @Definitivo_Fis_Catalogo_Id =
						(Select Id
						  From Fis_Catalogo
						  Where Fecha_Publicacion =
								(Select Max(Fecha_Publicacion) From Fis_Catalogo
								Where Fecha_Publicacion <=@Fecha_Reajuste_Definitivo))


UPDATE [Fis_Planilla] SET [Id] = @Id, [Codigo] = @Codigo, [Estado] = @Estado, [Descripcion] = @Descripcion, [Tipo_Planilla] = @Tipo_Planilla, [Apu_Presupuesto_Id] = @Apu_Presupuesto_Id, [Fecha_Inicio_Ingreso] = @Fecha_Inicio_Ingreso, [Fecha_Inicial] = @Fecha_Inicial, [Fecha_Final] = @Fecha_Final, [Fecha_Ultimo_Ingreso] = @Fecha_Ultimo_Ingreso, [Porcentaje_Iva] = @Porcentaje_Iva, [Porcentaje_Retencion] = @Porcentaje_Retencion, [Fecha_Reajuste_Provisional] = @Fecha_Reajuste_Provisional, [Fecha_Reajuste_Definitivo] = @Fecha_Reajuste_Definitivo, [Numero_Planilla] = @Numero_Planilla, [Descripcion_Provisional] = @Descripcion_Provisional, [Descripcion_Definitiva] = @Descripcion_Definitiva, [Anticipo_Devengar] = @Anticipo_Devengar, [Provisional_Fis_Catalogo_Id] = @Provisional_Fis_Catalogo_Id, [Definitivo_Fis_Catalogo_Id] = @Definitivo_Fis_Catalogo_Id WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)) AND ([Tipo_Planilla] = @Original_Tipo_Planilla) AND ([Apu_Presupuesto_Id] = @Original_Apu_Presupuesto_Id) AND ([Fecha_Inicio_Ingreso] = @Original_Fecha_Inicio_Ingreso) AND ([Fecha_Inicial] = @Original_Fecha_Inicial) AND ([Fecha_Final] = @Original_Fecha_Final) AND ([Fecha_Ultimo_Ingreso] = @Original_Fecha_Ultimo_Ingreso) AND ([Porcentaje_Iva] = @Original_Porcentaje_Iva) AND ([Porcentaje_Retencion] = @Original_Porcentaje_Retencion) AND ([Fecha_Reajuste_Provisional] = @Original_Fecha_Reajuste_Provisional) AND ([Fecha_Reajuste_Definitivo] = @Original_Fecha_Reajuste_Definitivo) AND ([Numero_Planilla] = @Original_Numero_Planilla) AND ((@IsNull_Descripcion_Provisional = 1 AND [Descripcion_Provisional] IS NULL) OR ([Descripcion_Provisional] = @Original_Descripcion_Provisional)) AND ((@IsNull_Descripcion_Definitiva = 1 AND [Descripcion_Definitiva] IS NULL) OR ([Descripcion_Definitiva] = @Original_Descripcion_Definitiva)) AND ([Anticipo_Devengar] = @Original_Anticipo_Devengar) AND ((@IsNull_Provisional_Fis_Catalogo_Id = 1 AND [Provisional_Fis_Catalogo_Id] IS NULL) OR ([Provisional_Fis_Catalogo_Id] = @Original_Provisional_Fis_Catalogo_Id)) AND ((@IsNull_Definitivo_Fis_Catalogo_Id = 1 AND [Definitivo_Fis_Catalogo_Id] IS NULL) OR ([Definitivo_Fis_Catalogo_Id] = @Original_Definitivo_Fis_Catalogo_Id)));
	
SELECT Id, Codigo, Estado, Descripcion, Tipo_Planilla, Apu_Presupuesto_Id, Fecha_Inicio_Ingreso, Fecha_Inicial, Fecha_Final, Fecha_Ultimo_Ingreso, Porcentaje_Iva, Porcentaje_Retencion, Fecha_Reajuste_Provisional, Fecha_Reajuste_Definitivo, Numero_Planilla, Descripcion_Provisional, Descripcion_Definitiva, Anticipo_Devengar, Provisional_Fis_Catalogo_Id, Definitivo_Fis_Catalogo_Id FROM Fis_Planilla WHERE (Id = @Id)
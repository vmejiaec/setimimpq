CREATE PROCEDURE [dbo].[Apu_Presupuesto_Formula_Update]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Estado char(3),
	@Apu_Presupuesto_Id varchar(17),
	@Apu_Indice_Id varchar(17),
	@Apu_Indice_Codigo varchar(200),
	@Apu_Indice_Nombre varchar(500),
	@Costo_Total numeric(17, 4),
	@Coeficiente numeric(17, 4),
	@Letra varchar(1),
	@Costo_Actual numeric(17, 4),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@Original_Apu_Presupuesto_Id varchar(17),
	@Original_Apu_Indice_Id varchar(17),
	@Original_Apu_Indice_Codigo varchar(200),
	@Original_Apu_Indice_Nombre varchar(500),
	@Original_Costo_Total numeric(17, 4),
	@Original_Coeficiente numeric(17, 4),
	@IsNull_Letra Int,
	@Original_Letra varchar(1),
	@Original_Costo_Actual numeric(17, 4)
)
AS
	SET NOCOUNT OFF;

--**************** Codigo Fijo que debe ser incluido en el sp ***---
--   JPU Septiembre 21 2009
--   inicio
--***************************************************************---

DECLARE
	@v_Fecha_Indice_Base smalldatetime,
	@v_Fis_Catalogo varchar(17),
	@v_mensaje VARCHAR(200),
	@v_Origen char(3),
	@v_Apu_Origen_Id varchar(17),
	@v_Codigo_Institucional varchar(200),
	@v_Fecha_APU_Aprobacion  smalldatetime,
	@v_Fecha_Oferta_Cierre   smalldatetime,
	@v_Contrato_Tipo      varchar(1)
	


BEGIN TRY


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
		[Contrato_Tipo] [varchar](200) NULL	)


	-- Se obtiene los datos del presupuesto
	Select @v_Origen = Origen,
		   @v_Apu_Origen_Id = Apu_Origen_Id
	From Apu_Presupuesto
	Where Id = @Apu_Presupuesto_Id;

	-- Se obtiene el Código Institucional
	set @v_Codigo_Institucional = dbo._Apu_Presupuesto_Codigo_Institucional(@v_Origen, @v_Apu_Origen_Id);
	
	insert into  #Apu_Presupuesto_Temporal
	exec dbo.Int_Contrato_ByCodigo_Institucional @v_Codigo_Institucional;

		Select -- Se obtiene la fecha final del proyecto
			@v_Fecha_APU_Aprobacion  = Fecha_APU_Aprobacion,
			@v_Fecha_Oferta_Cierre   = Fecha_Oferta_Cierre,
			@v_Contrato_Tipo       = Contrato_Tipo
	 From #Apu_Presupuesto_Temporal
	 Where Codigo_Institucional = @v_Codigo_Institucional


	If (ltrim(rtrim(@v_Contrato_Tipo)) = '1') --PRINCIPAL
		set @v_Fecha_Indice_Base =	Dateadd (DAY, -30, isnull(@v_Fecha_Oferta_Cierre,getDate()))
	Else if ((ltrim(rtrim(@v_Contrato_Tipo))) = '0') --COMPLEMENTARIO
		set @v_Fecha_Indice_Base = @v_Fecha_APU_Aprobacion


	Select @v_Fis_Catalogo =
		(Select Id
		From Fis_Catalogo 
		Where Fecha_Publicacion =
			(Select Max(Fecha_Publicacion)
			From Fis_Catalogo
			Where Fecha_Publicacion <= @v_Fecha_Indice_Base))
	
	
	
	--- Actualizar el valor de los INDICES
	Update	Apu_Presupuesto_Formula
		set Costo_Actual = 
				isnull((Select Valor
				From Fis_Catalogo_Indice
				Where Fis_Catalogo_Indice.Apu_Indice_Id = Apu_Presupuesto_Formula.Apu_Indice_Id
				And Fis_Catalogo_Id = @v_Fis_Catalogo),0)
	Where Apu_Presupuesto_Id = @Apu_Presupuesto_Id
	And Estado = @Estado
	
	

	--Se actualzai el registro de mano de obra
	update Apu_Presupuesto_Formula
	set Costo_Actual = isnull(dbo._Apu_Presupuesto_Cuadrilla_Costo_Total(@Apu_Presupuesto_Id, @Estado),0)
	Where Apu_Indice_Id = (Select ManoObra_Apu_Indice_Id
						   From Apu_Presupuesto
						   Where Id = @Apu_Presupuesto_Id)
	And Apu_Presupuesto_Id = @Apu_Presupuesto_Id
	And Estado = @Estado
	
	

	SELECT Id, Codigo, Estado, Apu_Presupuesto_Id, Apu_Indice_Id, Apu_Indice_Codigo, Apu_Indice_Nombre, Costo_Total, Coeficiente, Letra, Costo_Actual 
	FROM Apu_Presupuesto_Formula 
	WHERE (Id = @Id)


END TRY
BEGIN CATCH

	SET @v_mensaje = 'MSJ102';
	RAISERROR (N'%s', -- Message text.
               12, -- Severity,
               1, -- State,
               @v_mensaje, -- First argument.
               1); -- Second argument.
	RETURN
END CATCH


--fin


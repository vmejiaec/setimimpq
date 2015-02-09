CREATE PROCEDURE dbo.Fis_Ampliacion_ById
(
   @p_Ver_Version_Id VARCHAR(17),
   @p_Id VARCHAR(17)
)
AS
	SET NOCOUNT ON;
BEGIN
	DECLARE 
		@v_Codigo_Institucional varchar(200),
		@v_Fecha_Final smalldatetime,
		@v_Plazo_Prorroga int,
		@v_Fecha_Final_Prorroga smalldatetime,
		@v_Origen varchar(3),
		@v_Apu_Origen_Id varchar(17),
		@v_Apu_Presupuesto_Id varchar(17),
	    @v_Tipo_Contrato varchar(3)
	
	-- Obtener el Prespuesto al que pertenece la ampliación
	set @v_Apu_Presupuesto_Id = dbo.Fis_Ampliacion_Apu_Presupuesto_Id (@p_Id);

	----------------------------------------------------------------------
	Select 
		@v_Origen = Origen,
		@v_Apu_Origen_Id = Apu_Origen_Id
	From Apu_Presupuesto
	Where Id = @v_Apu_Presupuesto_Id;

	set @v_Codigo_Institucional = dbo._Apu_Presupuesto_Codigo_Institucional(@v_Origen, @v_Apu_Origen_Id);
	
                                      
	CREATE TABLE #tFON_CON_Proyecto(
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

	
	insert into  #tFON_CON_Proyecto
	exec dbo.Int_Contrato_ByOrigenOrigen_Id @v_Origen, @v_apu_Origen_Id
			  
	-- Si se utiliza para obtener la prorroga
	select  @v_Fecha_Final = 
				(select dateadd (Day, Plazo, Fecha_Contrato_Firma)
				 from  #tFON_CON_Proyecto
				where Codigo_Institucional = @v_Codigo_Institucional
)

	drop table #tFON_CON_Proyecto

	select @v_Plazo_Prorroga =
			(Select  sum(Plazo_Dias)
			 From Fis_Ampliacion
			 Where Apu_Presupuesto_Id = @v_Apu_Presupuesto_Id);

	select @v_Fecha_Final_Prorroga = Dateadd (Day ,@v_Plazo_Prorroga, @v_Fecha_Final);

	-------------------------------------------------------------------------------
	-------------------------------------------------------------------------------


	SELECT  
		Id,
		Codigo,
		Estado,
		Descripcion,
		Apu_Presupuesto_Id,
		Nombre,
		Fecha_Autorizacion,
		Plazo_Dias,
		
		isnull(@v_Plazo_Prorroga,0) Plazo_Total_Prorroga,
		isnull(@v_Fecha_Final_Prorroga,getdate()) Fecha_Final_Prorroga,

		dbo.Estado('FIS_AMPLIACION', 'ESTADO', estado, @p_Ver_Version_Id) Estado_Nombre 
		
	FROM Fis_Ampliacion
	WHERE Id = @p_Id
END


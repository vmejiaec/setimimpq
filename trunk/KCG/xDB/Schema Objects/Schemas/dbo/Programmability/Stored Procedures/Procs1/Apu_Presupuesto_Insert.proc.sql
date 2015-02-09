CREATE PROCEDURE dbo.Apu_Presupuesto_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Origen_Id varchar(17),
	@Apu_Origen_Codigo varchar(200),
	@Apu_Origen_Nombre varchar(500),
	@Origen char(3),
	@Costo_Directo numeric(17, 4),
	@Costo_Total numeric(17, 4),
	@Costo_Indirecto numeric(17, 4),
	@Costo_Otros numeric(17, 4),
	@Equipo_Apu_Indice_Id varchar(17),
	@ManoObra_Apu_Indice_Id varchar(170),
	@Porcentaje_Costo_Indirecto numeric(5, 2),
	@Int_Sucursal_Id varchar(17),
	@Apu_Mano_Obra_Id varchar(17),
	@Estado char(3),
	@Fiscalizador_Per_Personal_Id varchar(17),
	@Contratista_Per_Personal_Id varchar(17),
	@Fecha_Indices_Def smalldatetime,
	@Fecha_Creacion smalldatetime,
	@Creacion_Per_Personal_Id varchar(17),
	@Fecha_Update smalldatetime,
	@Update_Per_Personal_Id varchar(17),
	@Tipo char(3)
)
AS
	SET NOCOUNT OFF;
BEGIN
	DECLARE
		@v_Codigo_Institucional varchar(200),
		@v_Contratista_Per_Personal_Id varchar(17),
		@v_Contratista_Cedula varchar(200),
		@v_Contrato_Tipo varchar(200) = '1',
		@v_Fecha_APU_Aprobacion smalldatetime,
		@v_Fecha_Oferta_Cierre smalldatetime,
		@v_Fecha_Indice_Base smalldatetime

	

	--Crear la tabla temporal
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

	set @v_Codigo_Institucional = dbo._Apu_Presupuesto_Codigo_Institucional(@Origen,@Apu_Origen_Id);

	--Obtener la información de Contratos para insertar el Presupuesto
	insert into  #Apu_Presupuesto_Temporal
	exec dbo.Int_Contrato_ByCodigo_Institucional @v_Codigo_Institucional ;

	Select @v_Contratista_Cedula= Contratista_Cedula,
		   @v_contrato_Tipo = Contrato_Tipo,
		   @v_Fecha_Oferta_Cierre   = Fecha_Oferta_Cierre,
		   @v_Fecha_APU_Aprobacion  = Fecha_APU_Aprobacion
	From #Apu_Presupuesto_Temporal
	Where Codigo_Institucional = @v_Codigo_Institucional



	-- Obtener la fecha_indice_base
	If (ltrim(rtrim(@v_Contrato_Tipo)) = '1') --PRINCIPAL
		set @v_Fecha_Indice_Base =	Dateadd (DAY, 30, isnull(@v_Fecha_Oferta_Cierre,getDate()))
	Else if ((ltrim(rtrim(@v_Contrato_Tipo))) = '2') --COMPLEMENTARIO
		set @v_Fecha_Indice_Base = @v_Fecha_APU_Aprobacion

	Set @Fecha_Indices_Def= @v_Fecha_Indice_Base


	--- Obtener el contratista de la OBRA
	set @v_Contratista_Per_Personal_Id = dbo.Per_Personal_Id(@v_Contratista_Cedula);

	drop table #Apu_Presupuesto_Temporal;
	--------------------------------------------------------------------------

	INSERT INTO [Apu_Presupuesto] 
		([Id], 
		[Codigo], 
		[Apu_Origen_Id], 
		[Apu_Origen_Codigo], 
		[Apu_Origen_Nombre], 
		[Origen], 
		[Costo_Directo], 
		[Costo_Total], 
		[Costo_Indirecto], 
		[Costo_Otros], 
		[Equipo_Apu_Indice_Id], 
		[ManoObra_Apu_Indice_Id], 
		[Porcentaje_Costo_Indirecto], 
		[Int_Sucursal_Id], 
		[Apu_Mano_Obra_Id], 
		[Estado], 
		[Fiscalizador_Per_Personal_Id], 
		[Contratista_Per_Personal_Id], 
		[Fecha_Indices_Def], 
		[Fecha_Creacion], 
		[Creacion_Per_Personal_Id], 
		[Fecha_Update], 
		[Update_Per_Personal_Id], 
		[Tipo]) 
	VALUES 
		(@Id, 
		@Codigo, 
		@Apu_Origen_Id, 
		@Apu_Origen_Codigo, 
		@Apu_Origen_Nombre, 
		@Origen, 
		@Costo_Directo, 
		@Costo_Total, 
		@Costo_Indirecto, 
		@Costo_Otros, 
		@Equipo_Apu_Indice_Id, 
		@ManoObra_Apu_Indice_Id, 
		@Porcentaje_Costo_Indirecto, 
		@Int_Sucursal_Id, 
		@Apu_Mano_Obra_Id, 
		@Estado, 
		@Fiscalizador_Per_Personal_Id, 
		@v_Contratista_Per_Personal_Id, --@Contratista_Per_Personal_Id, 
		isnull(@Fecha_Indices_Def, getDate()), 
		@Fecha_Creacion, 
		@Creacion_Per_Personal_Id, 
		@Fecha_Update, 
		@Update_Per_Personal_Id, 
		@Tipo);
	
	SELECT 
		Id, 
		Codigo, 
		Apu_Origen_Id, 
		Apu_Origen_Codigo, 
		Apu_Origen_Nombre, 
		Origen, 
		Costo_Directo, 
		Costo_Total, 
		Costo_Indirecto, 
		Costo_Otros, 
		Equipo_Apu_Indice_Id, 
		ManoObra_Apu_Indice_Id, 
		Porcentaje_Costo_Indirecto, 
		Int_Sucursal_Id, 
		Apu_Mano_Obra_Id, 
		Estado, 
		Fiscalizador_Per_Personal_Id, 
		@v_Contratista_Per_Personal_Id, --Contratista_Per_Personal_Id, 
		Fecha_Indices_Def, 
		Fecha_Creacion, 
		Creacion_Per_Personal_Id, 
		Fecha_Update, 
		Update_Per_Personal_Id, 
		Tipo 
	FROM Apu_Presupuesto 
	WHERE (Id = @Id)

end
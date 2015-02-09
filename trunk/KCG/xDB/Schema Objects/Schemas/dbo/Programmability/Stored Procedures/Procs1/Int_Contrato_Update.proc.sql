CREATE PROCEDURE [dbo].[Int_Contrato_Update]
(
	@v_Codigo_Institucional varchar(200)
)
AS
	SET NOCOUNT ON;

BEGIN	
		
	CREATE TABLE #Temporal_Proyecto(
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

	Insert into  dbo.#Temporal_Proyecto
	EXEC  dbo.Int_Contrato_ByCodigo_Institucional @v_Codigo_Institucional 

	
	select * from  dbo.#Temporal_Proyecto
	drop Table dbo.#Temporal_Proyecto


END
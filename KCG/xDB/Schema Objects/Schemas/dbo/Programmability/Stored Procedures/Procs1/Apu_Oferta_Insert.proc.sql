CREATE PROCEDURE [dbo].[Apu_Oferta_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Apu_Lugar_Id varchar(17),
	@Area numeric(17, 4),
	@Porcentaje_Costo_Indirecto numeric(5, 2),
	@Porcentaje_Costo_Otros numeric(5, 2),
	@Fecha_Creacion smalldatetime,
	@Creacion_Per_Personal_Id varchar(17),
	@Fecha_Update smalldatetime,
	@Update_Per_Personal_Id varchar(17),
	@Contratista varchar(500),
	@Tecnico_Per_Personal_Id varchar(17),
	@Etapa char(3),
	@Int_Sucursal_Id varchar(17),
	@Int_Moneda_Id varchar(17),
	@Estado char(3),
	@Descripcion varchar(2000),
	@Codigo_Institucion varchar(200),
	@Tipo_Contrato char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Oferta] ([Id], [Codigo], [Nombre], [Apu_Lugar_Id], [Area], [Porcentaje_Costo_Indirecto], [Porcentaje_Costo_Otros], [Fecha_Creacion], [Creacion_Per_Personal_Id], [Fecha_Update], [Update_Per_Personal_Id], [Contratista], [Tecnico_Per_Personal_Id], [Etapa], [Int_Sucursal_Id], [Int_Moneda_Id], [Estado], [Descripcion], [Codigo_Institucion], [Tipo_Contrato]) VALUES (@Id, @Codigo, @Nombre, @Apu_Lugar_Id, @Area, @Porcentaje_Costo_Indirecto, @Porcentaje_Costo_Otros, @Fecha_Creacion, @Creacion_Per_Personal_Id, @Fecha_Update, @Update_Per_Personal_Id, @Contratista, @Tecnico_Per_Personal_Id, @Etapa, @Int_Sucursal_Id, @Int_Moneda_Id, @Estado, @Descripcion, @Codigo_Institucion, @Tipo_Contrato);
	
SELECT Id, Codigo, Nombre, Apu_Lugar_Id, Area, Porcentaje_Costo_Indirecto, Porcentaje_Costo_Otros, Fecha_Creacion, Creacion_Per_Personal_Id, Fecha_Update, Update_Per_Personal_Id, Contratista, Tecnico_Per_Personal_Id, Etapa, Int_Sucursal_Id, Int_Moneda_Id, Estado, Descripcion, Codigo_Institucion, Tipo_Contrato FROM Apu_Oferta WHERE (Id = @Id)
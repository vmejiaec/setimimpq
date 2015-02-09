CREATE PROCEDURE [dbo].[Apu_Proyecto_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Codigo_Institucion varchar(200),
	@Nombre varchar(500),
	@Apu_Lugar_Id varchar(17),
	@Area numeric(17, 4),
	@Porcentaje_Costo_Indirecto numeric(5, 2),
	@Porcentaje_Costo_Otros numeric(5, 2),
	@Fecha_Creacion smalldatetime,
	@Coordinador_Per_Personal_Id varchar(17),
	@Tecnico_Per_Personal_Id varchar(17),
	@Etapa char(3),
	@Int_Sucursal_Id varchar(17),
	@Int_Moneda_Id varchar(17),
	@Fecha_Update smalldatetime,
	@Creacion_Per_Personal_Id varchar(17),
	@Update_Per_Personal_Id varchar(17),
	@Estado char(3),
	@Costo_Directo numeric(17, 4),
	@Costo_Total numeric(17, 4),
	@Costo_Indirecto numeric(17, 4),
	@Costo_Otros numeric(17, 4),
	@Descripcion varchar(2000),
	@Tipo_Contrato char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Proyecto] ([Id], [Codigo], [Codigo_Institucion], [Nombre], [Apu_Lugar_Id], [Area], [Porcentaje_Costo_Indirecto], [Porcentaje_Costo_Otros], [Fecha_Creacion], [Coordinador_Per_Personal_Id], [Tecnico_Per_Personal_Id], [Etapa], [Int_Sucursal_Id], [Int_Moneda_Id], [Fecha_Update], [Creacion_Per_Personal_Id], [Update_Per_Personal_Id], [Estado], [Costo_Directo], [Costo_Total], [Costo_Indirecto], [Costo_Otros], [Descripcion], [Tipo_Contrato]) VALUES (@Id, @Codigo, @Codigo_Institucion, @Nombre, @Apu_Lugar_Id, @Area, @Porcentaje_Costo_Indirecto, @Porcentaje_Costo_Otros, @Fecha_Creacion, @Coordinador_Per_Personal_Id, @Tecnico_Per_Personal_Id, @Etapa, @Int_Sucursal_Id, @Int_Moneda_Id, @Fecha_Update, @Creacion_Per_Personal_Id, @Update_Per_Personal_Id, @Estado, @Costo_Directo, @Costo_Total, @Costo_Indirecto, @Costo_Otros, @Descripcion, @Tipo_Contrato);
	
SELECT Id, Codigo, Codigo_Institucion, Nombre, Apu_Lugar_Id, Area, Porcentaje_Costo_Indirecto, Porcentaje_Costo_Otros, Fecha_Creacion, Coordinador_Per_Personal_Id, Tecnico_Per_Personal_Id, Etapa, Int_Sucursal_Id, Int_Moneda_Id, Fecha_Update, Creacion_Per_Personal_Id, Update_Per_Personal_Id, Estado, Costo_Directo, Costo_Total, Costo_Indirecto, Costo_Otros, Descripcion, Tipo_Contrato FROM Apu_Proyecto WHERE (Id = @Id)
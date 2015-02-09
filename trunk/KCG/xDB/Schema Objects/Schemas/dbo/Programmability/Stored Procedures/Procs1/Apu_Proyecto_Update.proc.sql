CREATE PROCEDURE [dbo].[Apu_Proyecto_Update]
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
	@Tipo_Contrato char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@IsNull_Codigo_Institucion Int,
	@Original_Codigo_Institucion varchar(200),
	@Original_Nombre varchar(500),
	@Original_Apu_Lugar_Id varchar(17),
	@Original_Area numeric(17, 4),
	@Original_Porcentaje_Costo_Indirecto numeric(5, 2),
	@Original_Porcentaje_Costo_Otros numeric(5, 2),
	@Original_Fecha_Creacion smalldatetime,
	@IsNull_Coordinador_Per_Personal_Id Int,
	@Original_Coordinador_Per_Personal_Id varchar(17),
	@Original_Tecnico_Per_Personal_Id varchar(17),
	@Original_Etapa char(3),
	@Original_Int_Sucursal_Id varchar(17),
	@Original_Int_Moneda_Id varchar(17),
	@Original_Fecha_Update smalldatetime,
	@Original_Creacion_Per_Personal_Id varchar(17),
	@Original_Update_Per_Personal_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@IsNull_Costo_Directo Int,
	@Original_Costo_Directo numeric(17, 4),
	@IsNull_Costo_Total Int,
	@Original_Costo_Total numeric(17, 4),
	@IsNull_Costo_Indirecto Int,
	@Original_Costo_Indirecto numeric(17, 4),
	@IsNull_Costo_Otros Int,
	@Original_Costo_Otros numeric(17, 4),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000),
	@Original_Tipo_Contrato char(3)
)
AS
	SET NOCOUNT OFF;

--**************** Codigo Fijo que debe ser incluido en el sp ***---
--   JPU Septiembre 21 2009
--   inicio
--***************************************************************---

set @Costo_Directo= dbo._Apu_Proyecto_Costo_Directo (@Id)
set @Costo_Indirecto=   dbo._Apu_Proyecto_Costo_Indirecto(@Id)
set @Costo_Otros= dbo._Apu_Proyecto_Costo_Otros (@Id)
set @Costo_Total= dbo._Apu_Proyecto_Costo_Total(@Id)
--fin

UPDATE [Apu_Proyecto] SET [Id] = @Id, [Codigo] = @Codigo, [Codigo_Institucion] = @Codigo_Institucion, [Nombre] = @Nombre, [Apu_Lugar_Id] = @Apu_Lugar_Id, [Area] = @Area, [Porcentaje_Costo_Indirecto] = @Porcentaje_Costo_Indirecto, [Porcentaje_Costo_Otros] = @Porcentaje_Costo_Otros, [Fecha_Creacion] = @Fecha_Creacion, [Coordinador_Per_Personal_Id] = @Coordinador_Per_Personal_Id, [Tecnico_Per_Personal_Id] = @Tecnico_Per_Personal_Id, [Etapa] = @Etapa, [Int_Sucursal_Id] = @Int_Sucursal_Id, [Int_Moneda_Id] = @Int_Moneda_Id, [Fecha_Update] = @Fecha_Update, [Creacion_Per_Personal_Id] = @Creacion_Per_Personal_Id, [Update_Per_Personal_Id] = @Update_Per_Personal_Id, [Estado] = @Estado, [Costo_Directo] = @Costo_Directo, [Costo_Total] = @Costo_Total, [Costo_Indirecto] = @Costo_Indirecto, [Costo_Otros] = @Costo_Otros, [Descripcion] = @Descripcion, [Tipo_Contrato] = @Tipo_Contrato WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ((@IsNull_Codigo_Institucion = 1 AND [Codigo_Institucion] IS NULL) OR ([Codigo_Institucion] = @Original_Codigo_Institucion)) AND ([Nombre] = @Original_Nombre) AND ([Apu_Lugar_Id] = @Original_Apu_Lugar_Id) AND ([Area] = @Original_Area) AND ([Porcentaje_Costo_Indirecto] = @Original_Porcentaje_Costo_Indirecto) AND ([Porcentaje_Costo_Otros] = @Original_Porcentaje_Costo_Otros) AND ([Fecha_Creacion] = @Original_Fecha_Creacion) AND ((@IsNull_Coordinador_Per_Personal_Id = 1 AND [Coordinador_Per_Personal_Id] IS NULL) OR ([Coordinador_Per_Personal_Id] = @Original_Coordinador_Per_Personal_Id)) AND ([Tecnico_Per_Personal_Id] = @Original_Tecnico_Per_Personal_Id) AND ([Etapa] = @Original_Etapa) AND ([Int_Sucursal_Id] = @Original_Int_Sucursal_Id) AND ([Int_Moneda_Id] = @Original_Int_Moneda_Id) AND ([Fecha_Update] = @Original_Fecha_Update) AND ([Creacion_Per_Personal_Id] = @Original_Creacion_Per_Personal_Id) AND ([Update_Per_Personal_Id] = @Original_Update_Per_Personal_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Costo_Directo = 1 AND [Costo_Directo] IS NULL) OR ([Costo_Directo] = @Original_Costo_Directo)) AND ((@IsNull_Costo_Total = 1 AND [Costo_Total] IS NULL) OR ([Costo_Total] = @Original_Costo_Total)) AND ((@IsNull_Costo_Indirecto = 1 AND [Costo_Indirecto] IS NULL) OR ([Costo_Indirecto] = @Original_Costo_Indirecto)) AND ((@IsNull_Costo_Otros = 1 AND [Costo_Otros] IS NULL) OR ([Costo_Otros] = @Original_Costo_Otros)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)) AND ([Tipo_Contrato] = @Original_Tipo_Contrato));
	
SELECT Id, Codigo, Codigo_Institucion, Nombre, Apu_Lugar_Id, Area, Porcentaje_Costo_Indirecto, Porcentaje_Costo_Otros, Fecha_Creacion, Coordinador_Per_Personal_Id, Tecnico_Per_Personal_Id, Etapa, Int_Sucursal_Id, Int_Moneda_Id, Fecha_Update, Creacion_Per_Personal_Id, Update_Per_Personal_Id, Estado, Costo_Directo, Costo_Total, Costo_Indirecto, Costo_Otros, Descripcion, Tipo_Contrato FROM Apu_Proyecto WHERE (Id = @Id)
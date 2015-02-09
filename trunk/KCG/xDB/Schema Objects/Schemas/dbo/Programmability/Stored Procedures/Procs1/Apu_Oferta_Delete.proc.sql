﻿CREATE PROCEDURE [dbo].[Apu_Oferta_Delete]
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Apu_Lugar_Id varchar(17),
	@IsNull_Area Int,
	@Original_Area numeric(17, 4),
	@Original_Porcentaje_Costo_Indirecto numeric(5, 2),
	@Original_Porcentaje_Costo_Otros numeric(5, 2),
	@Original_Fecha_Creacion smalldatetime,
	@Original_Creacion_Per_Personal_Id varchar(17),
	@IsNull_Fecha_Update Int,
	@Original_Fecha_Update smalldatetime,
	@IsNull_Update_Per_Personal_Id Int,
	@Original_Update_Per_Personal_Id varchar(17),
	@IsNull_Contratista Int,
	@Original_Contratista varchar(500),
	@Original_Tecnico_Per_Personal_Id varchar(17),
	@Original_Etapa char(3),
	@Original_Int_Sucursal_Id varchar(17),
	@Original_Int_Moneda_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000),
	@IsNull_Codigo_Institucion Int,
	@Original_Codigo_Institucion varchar(200),
	@Original_Tipo_Contrato char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Apu_Oferta] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Apu_Lugar_Id] = @Original_Apu_Lugar_Id) AND ((@IsNull_Area = 1 AND [Area] IS NULL) OR ([Area] = @Original_Area)) AND ([Porcentaje_Costo_Indirecto] = @Original_Porcentaje_Costo_Indirecto) AND ([Porcentaje_Costo_Otros] = @Original_Porcentaje_Costo_Otros) AND ([Fecha_Creacion] = @Original_Fecha_Creacion) AND ([Creacion_Per_Personal_Id] = @Original_Creacion_Per_Personal_Id) AND ((@IsNull_Fecha_Update = 1 AND [Fecha_Update] IS NULL) OR ([Fecha_Update] = @Original_Fecha_Update)) AND ((@IsNull_Update_Per_Personal_Id = 1 AND [Update_Per_Personal_Id] IS NULL) OR ([Update_Per_Personal_Id] = @Original_Update_Per_Personal_Id)) AND ((@IsNull_Contratista = 1 AND [Contratista] IS NULL) OR ([Contratista] = @Original_Contratista)) AND ([Tecnico_Per_Personal_Id] = @Original_Tecnico_Per_Personal_Id) AND ([Etapa] = @Original_Etapa) AND ([Int_Sucursal_Id] = @Original_Int_Sucursal_Id) AND ([Int_Moneda_Id] = @Original_Int_Moneda_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)) AND ((@IsNull_Codigo_Institucion = 1 AND [Codigo_Institucion] IS NULL) OR ([Codigo_Institucion] = @Original_Codigo_Institucion)) AND ([Tipo_Contrato] = @Original_Tipo_Contrato))
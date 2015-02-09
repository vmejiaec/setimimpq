CREATE PROCEDURE [dbo].[Fis_Planilla_Delete]
(
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

	DECLARE @v_max_planilla int,
	@v_mensaje varchar(10)

	Select @v_max_planilla= Max(Cast(Numero_Planilla as numeric) )
	from Fis_Planilla
	where Apu_Presupuesto_Id =@Original_Apu_Presupuesto_Id

	if (@v_max_planilla<>@Original_Numero_Planilla)
		BEGIN
			SET @v_mensaje = 'MSJ87';
			RAISERROR (N'%s', -- Message text.
						   12, -- Severity,
						   1, -- State,
						   @v_mensaje, -- First argument.
						   1); -- Second argument.
			RETURN
		END

DELETE FROM [Fis_Planilla] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)) AND ([Tipo_Planilla] = @Original_Tipo_Planilla) AND ([Apu_Presupuesto_Id] = @Original_Apu_Presupuesto_Id) AND ([Fecha_Inicio_Ingreso] = @Original_Fecha_Inicio_Ingreso) AND ([Fecha_Inicial] = @Original_Fecha_Inicial) AND ([Fecha_Final] = @Original_Fecha_Final) AND ([Fecha_Ultimo_Ingreso] = @Original_Fecha_Ultimo_Ingreso) AND ([Porcentaje_Iva] = @Original_Porcentaje_Iva) AND ([Porcentaje_Retencion] = @Original_Porcentaje_Retencion) AND ([Fecha_Reajuste_Provisional] = @Original_Fecha_Reajuste_Provisional) AND ([Fecha_Reajuste_Definitivo] = @Original_Fecha_Reajuste_Definitivo) AND ([Numero_Planilla] = @Original_Numero_Planilla) AND ((@IsNull_Descripcion_Provisional = 1 AND [Descripcion_Provisional] IS NULL) OR ([Descripcion_Provisional] = @Original_Descripcion_Provisional)) AND ((@IsNull_Descripcion_Definitiva = 1 AND [Descripcion_Definitiva] IS NULL) OR ([Descripcion_Definitiva] = @Original_Descripcion_Definitiva)) AND ([Anticipo_Devengar] = @Original_Anticipo_Devengar) AND ((@IsNull_Provisional_Fis_Catalogo_Id = 1 AND [Provisional_Fis_Catalogo_Id] IS NULL) OR ([Provisional_Fis_Catalogo_Id] = @Original_Provisional_Fis_Catalogo_Id)) AND ((@IsNull_Definitivo_Fis_Catalogo_Id = 1 AND [Definitivo_Fis_Catalogo_Id] IS NULL) OR ([Definitivo_Fis_Catalogo_Id] = @Original_Definitivo_Fis_Catalogo_Id)))
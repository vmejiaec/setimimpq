CREATE PROCEDURE [dbo].[Fis_Planilla_Det_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Estado char(3),
	@Descripcion varchar(2000),
	@Apu_Prespuesto_Rubro_Id varchar(17),
	@Apu_Rubro_Codigo varchar(200),
	@Apu_Rubro_Nombre varchar(500),
	@Apu_Rubro_Unidad varchar(500),
	@Costo numeric(17, 4),
	@Cantidad numeric(17, 2),
	@Fis_Planilla_Id varchar(17)
)
AS
	SET NOCOUNT OFF;
	DECLARE  @v_mensaje varchar(10),
	@p_Anticipo_x_Devengar numeric(17,4)

BEGIN TRY

INSERT INTO [Fis_Planilla_Det] ([Id], [Codigo], [Estado], [Descripcion], [Apu_Prespuesto_Rubro_Id], [Apu_Rubro_Codigo], [Apu_Rubro_Nombre], [Apu_Rubro_Unidad], [Costo], [Cantidad], [Fis_Planilla_Id]) VALUES (@Id, @Codigo, @Estado, @Descripcion, @Apu_Prespuesto_Rubro_Id, @Apu_Rubro_Codigo, @Apu_Rubro_Nombre, @Apu_Rubro_Unidad, @Costo, @Cantidad, @Fis_Planilla_Id);
	
SELECT Id, Codigo, Estado, Descripcion, Apu_Prespuesto_Rubro_Id, Apu_Rubro_Codigo, Apu_Rubro_Nombre, Apu_Rubro_Unidad, Costo, Cantidad, Fis_Planilla_Id FROM Fis_Planilla_Det WHERE (Id = @Id)



END TRY
BEGIN CATCH

	SET @v_mensaje = 'MSJ103';
	RAISERROR (N'%s|%d', -- Message text.
               12, -- Severity,
               1, -- State,
               @v_mensaje, -- First argument.
               @p_Anticipo_x_Devengar); -- Second argument.
	RETURN
END CATCH

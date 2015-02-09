CREATE PROCEDURE sp_obtener_numero_registros
  @as_codigo_institucion varchar(40),
  @as_codigo_sucursal varchar(40),
  @as_periodo_vigencia varchar(4),
  @as_codigo_tramite varchar(40),
  @as_numero integer,
  @as_area_trabajo varchar(8),
  @ai_num_reest integer,
  @as_codigo_tarea varchar(40),
  @as_codigo_responsable varchar(20)
AS

SELECT COUNT(*)
FROM GDSEGTRA
WHERE GD_CODIGO_INSTITUCION = @as_codigo_institucion AND
      GD_CODIGO_SUCURSAL = @as_codigo_sucursal AND
      GD_PERIODO = @as_periodo_vigencia AND
      GD_CODIGO_TRAMITE = @as_codigo_tramite AND
      GD_NUMERO = @as_numero AND
      GD_AREA_RESPONSABLE = @as_area_trabajo AND
      GD_NUMERO_REESTRUCTURA = @ai_num_reest AND
      GD_CODIGO_TAREA = @as_codigo_tarea AND
      GD_PERSONA_RESPONSABLE = @as_codigo_responsable

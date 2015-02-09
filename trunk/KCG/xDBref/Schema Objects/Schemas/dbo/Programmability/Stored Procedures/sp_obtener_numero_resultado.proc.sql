CREATE PROCEDURE sp_obtener_numero_resultado
  @as_codigo_institucion varchar(40),
  @as_codigo_sucursal varchar(40),
  @as_periodo_vigencia varchar(4),
  @as_codigo_tramite varchar(40),
  @as_numero integer
AS

SELECT MAX(GD_SECUENCIAL_RESPUESTA) + 1
FROM GDRESTRA
WHERE GD_CODIGO_INSTITUCION=@as_codigo_institucion AND
      GD_CODIGO_SUCURSAL=@as_codigo_sucursal AND
      GD_PERIODO=@as_periodo_vigencia AND
      GD_CODIGO_TRAMITE=@as_codigo_tramite AND
      GD_NUMERO=@as_numero




CREATE PROCEDURE sp_numero_secuencial_siguiente
  @as_codigo_institucion varchar(40),
  @as_codigo_sucursal varchar(40),
  @as_periodo_vigencia varchar(4),
  @as_codigo_tramite varchar(40)  
AS
UPDATE GDNUMINST
SET GD_NUMERO_INSTITUCIONAL = GD_NUMERO_INSTITUCIONAL + 1
WHERE GD_CODIGO_INSTITUCION=@as_codigo_institucion AND
      GD_CODIGO_SUCURSAL=@as_codigo_sucursal AND
      GD_PERIODO_VIGENCIA=@as_periodo_vigencia AND
      GD_CODIGO_TRAMITE=@as_codigo_tramite AND
      GD_ESTADO='ACTIVO' 




CREATE PROCEDURE sp_retorna_periodo_activo
   @as_codigo_tramite varchar(40),
   @as_codigo_institucion varchar(40),
   @as_codigo_sucursal varchar(40)
AS
SELECT GD_PERIODO_VIGENCIA
FROM GDNUMINST
WHERE GD_ESTADO='ACTIVO' AND 
      GD_CODIGO_INSTITUCION=@as_codigo_institucion AND
      GD_CODIGO_SUCURSAL=@as_codigo_sucursal AND
      GD_CODIGO_TRAMITE=@as_codigo_tramite 



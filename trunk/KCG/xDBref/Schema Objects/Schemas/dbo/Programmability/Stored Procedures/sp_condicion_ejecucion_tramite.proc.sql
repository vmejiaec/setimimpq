CREATE PROCEDURE dbo.sp_condicion_ejecucion_tramite
  @as_cod_institucion varchar(40),
  @as_cod_sucursal    varchar(40),
  @as_periodo	      varchar(4),
  @as_cod_tramite     varchar(40),
  @al_numero          Integer
AS

SELECT  GD_PARALELO 
FROM GDINFTRA
WHERE GD_CODIGO_INSTITUCION = @as_cod_institucion AND
      GD_CODIGO_SUCURSAL = @as_cod_sucursal AND   
      GD_PERIODO                    = @as_periodo AND           
      GD_CODIGO_TRAMITE    = @as_cod_tramite AND
      GD_NUMERO                    = @al_numero
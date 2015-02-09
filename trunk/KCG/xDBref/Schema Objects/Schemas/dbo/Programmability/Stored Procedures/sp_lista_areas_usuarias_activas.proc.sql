
CREATE PROCEDURE [dbo].[sp_lista_areas_usuarias_activas]
  @ai_num_estructura integer,
  @as_cod_institucion varchar(40),
  @as_cod_sucursal  varchar(40)
AS
SELECT GD_CODIGO_AREA,
       GD_NOMBRE_AREA,
       GD_SIGLAS,
       GD_AREA_PADRE
FROM GDAREUSU
WHERE GD_NUMERO_REESTRUCTURA = @ai_num_estructura AND
      GD_CODIGO_INSTITUCION = @as_cod_institucion AND
      GD_CODIGO_SUCURSAL = @as_cod_sucursal AND
      GD_ESTADO='ACTIVO' AND 
      GD_REASIGNA='SI'  OR
      GD_CODIGO_AREA='205020'
ORDER BY GD_NOMBRE_AREA


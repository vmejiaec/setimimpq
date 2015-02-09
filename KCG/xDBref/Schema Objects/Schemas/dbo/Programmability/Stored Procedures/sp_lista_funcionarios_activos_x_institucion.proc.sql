﻿
CREATE PROCEDURE [dbo].[sp_lista_funcionarios_activos_x_institucion]
  @as_codigo_institucion varchar(40)
AS
SELECT GDFUNCIONARIO_AREA.GD_CODIGO_PERSONA,
       GD_APELLIDOS+ ' '+ GD_NOMBRES
FROM GDFUNCIONARIO_AREA,
     GDFUNCIONARIOS
WHERE GDFUNCIONARIO_AREA.GD_CODIGO_PERSONA=GDFUNCIONARIOS.GD_CODIGO_PERSONA AND
      GD_ESTADO='ACTIVO' AND      
      GD_CODIGO_INSTITUCION= @as_codigo_institucion
ORDER BY GD_APELLIDOS+ ' '+ GD_NOMBRES



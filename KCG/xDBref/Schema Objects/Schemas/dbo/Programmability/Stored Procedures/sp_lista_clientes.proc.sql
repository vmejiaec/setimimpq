﻿CREATE PROCEDURE sp_lista_clientes
AS
SELECT GD_CODIGO_ENTIDAD,
       GD_TIPO_ENTIDAD,
       GD_NOMBRE
FROM GDMAECLI
WHERE GD_ACTIVA='SI'
ORDER BY GD_NOMBRE ASC



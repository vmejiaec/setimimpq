﻿
CREATE PROCEDURE sp_obtener_accion_siguiente                                                                                                                                                                                                                  
SELECT GD_TAREA_FINAL                                                                                                                                                                                                                                       
FROM GDSECTAR,                                                                                                                                                                                                                                                
ORDER BY GD_NOMBRE_TAREA


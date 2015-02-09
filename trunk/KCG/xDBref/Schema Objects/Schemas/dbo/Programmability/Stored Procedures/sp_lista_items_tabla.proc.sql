CREATE PROCEDURE sp_lista_items_tabla
   @as_nombre_tabla varchar(20)
AS
SELECT GD_CODIGO_ITEM,
       GD_NOMBRE
FROM GDADMLIS
WHERE GD_CODIGO_TABLA=@as_nombre_tabla AND
      GD_SECUENCIAL_ITEM<>0 AND
      GD_ACTIVO_ITEM='SI'
ORDER BY GD_NOMBRE ASC




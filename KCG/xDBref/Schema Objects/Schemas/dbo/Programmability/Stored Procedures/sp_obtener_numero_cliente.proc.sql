CREATE PROCEDURE sp_obtener_numero_cliente
  @as_codigo_institucion varchar(40)
AS

SELECT MAX(GD_CODIGO_ENTIDAD) + 1
FROM GDMAECLI
WHERE GD_CODIGO_INSTITUCION=@as_codigo_institucion 


CREATE PROCEDURE sp_retorna_nombre_institucion 
   @as_codigo_institucion varchar(40)
AS
SELECT GD_NOMBRE
FROM GDINFINS
WHERE GD_CODIGO_INSTITUCION=@as_codigo_institucion



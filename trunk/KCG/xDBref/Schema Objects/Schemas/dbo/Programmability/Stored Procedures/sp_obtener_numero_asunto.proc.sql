CREATE PROCEDURE sp_obtener_numero_asunto
  @as_codigo_institucion varchar(40)
AS

SELECT MAX(GD_CODIGO_ASUNTO) + 1
FROM GDCATASU
WHERE GD_CODIGO_INSTITUCION=@as_codigo_institucion 


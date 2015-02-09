CREATE PROCEDURE sp_lista_asuntos_activos
   @as_cod_institucion varchar(40)
AS
SELECT GD_CODIGO_ASUNTO,
       GD_NOMBRE,
       GD_ASUNTO_PADRE 
FROM GDCATASU
WHERE GD_ACTIVO='SI' AND GD_CODIGO_INSTITUCION=@as_cod_institucion 




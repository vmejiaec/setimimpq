CREATE PROCEDURE sp_retorna_cedula
   @as_user_name varchar(20)
AS

SELECT GD_CODIGO_PERSONA
FROM GDFUNCIONARIOS
WHERE GD_USER_NAME= @as_user_name



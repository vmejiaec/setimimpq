CREATE PROCEDURE sp_es_super_usuario
   @as_user_name varchar(20)
AS

SELECT GD_SUPER_USUARIO
FROM GDFUNCIONARIOS
WHERE GD_USER_NAME= @as_user_name


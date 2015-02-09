
CREATE PROCEDURE [dbo].[sp_retorna_codigo_institucion]
   @as_cedula varchar(20)
AS
SELECT GD_CODIGO_INSTITUCION
FROM GDFUNCIONARIO_AREA
WHERE GD_CODIGO_PERSONA=@as_cedula



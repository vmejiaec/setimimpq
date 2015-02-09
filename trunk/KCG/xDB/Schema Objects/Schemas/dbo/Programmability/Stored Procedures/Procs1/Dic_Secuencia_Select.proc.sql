CREATE PROCEDURE [dbo].[Dic_Secuencia_Select]
(
  @p_Ver_Version_id varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo, 
   Nombre, 
   Estado, 
   Valor_Actual, 
   Valor_Minimo, 
   Valor_Maximo, 
   Incremento,
   dbo.Estado ('DIC_SECUENCIA','ESTADO',estado, @p_ver_version_id) Estado_nombre
FROM   Dic_Secuencia




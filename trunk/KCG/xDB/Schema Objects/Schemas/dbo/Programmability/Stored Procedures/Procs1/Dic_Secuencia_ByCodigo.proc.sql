CREATE PROCEDURE [dbo].[Dic_Secuencia_ByCodigo]
(
  @p_Ver_Version_id varchar(17),
  @p_Codigo varchar(200)
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
where Codigo=@p_Codigo



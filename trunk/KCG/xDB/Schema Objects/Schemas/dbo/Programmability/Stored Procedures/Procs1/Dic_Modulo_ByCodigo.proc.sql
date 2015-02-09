CREATE PROCEDURE [dbo].[Dic_Modulo_ByCodigo]
(
	@p_Ver_Version_Id varchar(17),
    @p_Codigo varchar(200)
)
AS
	SET NOCOUNT ON;

    SELECT     
       Id, 
       Codigo, 
       Nombre, 
       Estado, 
       Descripcion, 

       dbo.Estado ('DIC_MODULO','ESTADO',Estado, @p_ver_version_id)  Estado_Nombre

FROM   Dic_Modulo
Where  Codigo = @p_Codigo 





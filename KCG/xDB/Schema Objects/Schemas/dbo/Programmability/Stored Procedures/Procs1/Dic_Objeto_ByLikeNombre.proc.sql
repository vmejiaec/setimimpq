CREATE PROCEDURE [dbo].[Dic_Objeto_ByLikeNombre]
(
  @p_Ver_Version_Id varchar(17),
  @p_Nombre varchar(500)
)
AS
	SET NOCOUNT ON;
SELECT     
    Id, 
    Codigo, 
    Nombre, 
    Dic_Modulo_Id, 
    Numero,  
    Estado,
    dbo.Dic_Modulo_Codigo (Dic_Modulo_Id) Dic_Modulo_Codigo,
    dbo.Dic_Modulo_Nombre (Dic_Modulo_Id) Dic_Modulo_Nombre,

    dbo.Estado ('DIC_OBJETO','ESTADO',Estado, @p_Ver_Version_Id) Estado_Nombre
FROM   Dic_Objeto
Where  upper(Nombre) like upper(@p_Nombre)







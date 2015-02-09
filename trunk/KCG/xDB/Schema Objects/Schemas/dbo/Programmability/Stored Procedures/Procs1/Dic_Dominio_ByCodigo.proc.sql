CREATE PROCEDURE [dbo].[Dic_Dominio_ByCodigo]
(
  @p_Ver_Version_Id varchar(17),
  @p_Codigo varchar(200)
)
AS
	SET NOCOUNT ON;
SELECT     
    Id, 
    Codigo, 
    Dic_Campo_Id, 
    Dominio, 
    Nombre, 
    Estado,

    dbo._Dic_Campo_Codigo (Dic_Campo_Id) Dic_Campo_Codigo,
    dbo._Dic_Campo_Nombre (Dic_Campo_Id) Dic_Campo_Nombre,

    dbo._Dic_Campo_Dic_Objeto_Id (dic_campo_id) Dic_Objeto_Id,
    dbo._Dic_Objeto_Codigo (dbo._Dic_Campo_Dic_Objeto_Id (Dic_Campo_Id)) Dic_Objeto_Codigo,
    dbo._Dic_Objeto_Nombre (dbo._Dic_Campo_Dic_Objeto_Id (Dic_Campo_Id)) Dic_Objeto_Nombre,

    dbo._Dic_Objeto_Dic_Modulo_Id(dbo._Dic_Campo_Dic_Objeto_Id (dic_campo_id)) Dic_Modulo_Id, 
    dbo._Dic_Modulo_Nombre(dbo._Dic_Objeto_Dic_Modulo_Id(dbo._Dic_Campo_Dic_Objeto_Id (dic_campo_id))) Dic_Modulo_Nombre,
    dbo._Dic_Modulo_Codigo(dbo._Dic_Objeto_Dic_Modulo_Id(dbo._Dic_Campo_Dic_Objeto_Id (dic_campo_id))) Dic_Modulo_Codigo,
  
    dbo.Estado ('DIC_DOMINIO','ESTADO',estado, @p_ver_version_id) Estado_Nombre

FROM     Dic_Dominio
where  Codigo=@p_Codigo






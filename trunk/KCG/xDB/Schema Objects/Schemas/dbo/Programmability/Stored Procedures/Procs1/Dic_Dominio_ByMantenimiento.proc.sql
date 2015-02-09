CREATE PROCEDURE [dbo].[Dic_Dominio_ByMantenimiento]
(
  @p_Ver_Version_id varchar(17)
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
WHERE id not in 
      (Select dic_dominio_id
       From Ver_dominio)
or   (Select count(*) 
       from Ver_dominio 
       where dic_dominio.id = ver_dominio.dic_dominio_id) 
    < (SELECT COUNT(*) FROM VER_VERSION)

       


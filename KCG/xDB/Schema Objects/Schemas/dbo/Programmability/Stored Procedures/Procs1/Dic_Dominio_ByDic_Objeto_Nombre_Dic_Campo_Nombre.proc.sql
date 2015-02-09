
CREATE PROCEDURE [dbo].[Dic_Dominio_ByDic_Objeto_Nombre_Dic_Campo_Nombre]
(
  @p_Ver_Version_Id varchar(17),
  @p_Dic_Objeto_Nombre varchar(200),
  @p_Dic_Campo_Nombre varchar(200)
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
where  
	Dic_Campo_Id in (
		select c.Id from Dic_Campo c where UPPER(c.Nombre) like upper(@p_Dic_Campo_Nombre)
	)
and Dic_Campo_Id in ( 
		select cc.Id from Dic_Campo cc where cc.Dic_Objeto_Id in 
			(select o.Id from Dic_Objeto o where UPPER(o.Nombre) like UPPER(@p_Dic_Objeto_Nombre) )
	)
order by Nombre
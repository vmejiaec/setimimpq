CREATE PROCEDURE [dbo].[Seg_Rol_Objeto_ById]
(
   @p_Ver_Version_Id varchar (17),
   @p_Id varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT     
    Id, 
    Codigo, 
    Seg_Rol_Id, 
    Dic_Con_Objeto_Id, 
    Tipo, 
    Estado,

    dbo._Seg_Rol_Codigo (Seg_Rol_Id) Seg_Rol_Codigo,
    dbo._Seg_Rol_Nombre (Seg_Rol_Id) Seg_Rol_Nombre,

    dbo._Dic_Con_Objeto_Codigo (Dic_con_Objeto_Id) Dic_con_Objeto_Codigo,
    dbo._Dic_Con_Objeto_Nombre (Dic_Con_Objeto_Id) Dic_Con_Objeto_Nombre,
    
    dbo._Dic_Con_Objeto_Dic_Objeto_Id(dic_con_objeto_id) Dic_Objeto_id,
    dbo._Dic_Objeto_Codigo(dbo._Dic_Con_Objeto_Dic_Objeto_Id(dic_con_objeto_id)) Dic_Objeto_Codigo,
    dbo._Dic_Objeto_Nombre(dbo._Dic_Con_Objeto_Dic_Objeto_Id(dic_con_objeto_id)) Dic_Objeto_Nombre,
    
    dbo._Dic_Con_Objeto_Dic_Contenedor_Id (Dic_con_Objeto_Id) Dic_contenedor_Id,
    dbo._Dic_Contenedor_Codigo (dbo._Dic_Con_Objeto_Dic_Contenedor_Id (Dic_con_Objeto_Id))Dic_contenedor_Codigo,
    dbo._Dic_Contenedor_Nombre (dbo._Dic_Con_Objeto_Dic_Contenedor_Id (Dic_con_Objeto_Id))Dic_contenedor_Nombre,

    dbo.Dominio('SEG_ROL_OBJETO','TIPO',tipo, @p_ver_version_id) Tipo_nombre,
    dbo.Estado('SEG_ROL_OBJETO','ESTADO',estado, @p_ver_version_id) Estado_nombre
FROM         Seg_Rol_Objeto
where Id=@p_Id





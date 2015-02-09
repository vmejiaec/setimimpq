CREATE PROCEDURE [dbo].[Seg_Rol_Menu_ByCodigo]
(
  @p_Ver_Version_Id varchar(17),
  @p_Codigo varchar(200) 
)
AS
	SET NOCOUNT ON;
SELECT     
    Id, 
    Codigo, 
    Estado, 
    Grupo, 
    Dic_Pantalla_Id, 
    Seg_Rol_Id, 
    Dic_Con_Elemento_Id,

    dbo.Estado ('SEG_ROL_MENU','ESTADO',Estado, @p_Ver_Version_Id) Estado_Nombre,
    dbo.Dominio('SEG_ROL_MENU','GRUPO',Grupo, @p_Ver_Version_Id) Grupo_Nombre,

    dbo._Dic_Pantalla_Codigo  (Dic_Pantalla_Id) Dic_Pantalla_Codigo,
    dbo._Dic_Pantalla_Nombre  (Dic_Pantalla_Id) Dic_Pantalla_Nombre,

    dbo._Seg_Rol_Codigo (Seg_Rol_Id) Seg_Rol_Codigo,
    dbo._Seg_Rol_Nombre (Seg_Rol_Id) Seg_Rol_Nombre,

    dbo._Dic_Con_Elemento_Codigo (Dic_Con_Elemento_Id) Dic_Con_Elemento_Codigo,
    dbo._Dic_Con_Elemento_Nombre (Dic_Con_Elemento_Id) Dic_con_elemento_nombre,

    dbo._Dic_Con_elemento_Dic_Contenedor_Id (Dic_Con_Elemento_Id) Dic_Contenedor_Id,
    dbo._Dic_Contenedor_Codigo (dbo._Dic_Con_Elemento_Dic_Contenedor_Id (Dic_Con_Elemento_Id))Dic_Contenedor_Codigo,
    dbo._Dic_Contenedor_Nombre (dbo._Dic_Con_Elemento_Dic_Contenedor_Id (Dic_Con_Elemento_Id))Dic_Contenedor_Nombre,

	-- 29 de Septiembre 2008 -- Elhy
    -- Datos de dic_pantalla
    dbo._Dic_Pantalla_Dic_Rotulo_Id(Dic_Pantalla_Id) Pantalla_Dic_Rotulo_Id,
    dbo._Dic_Rotulo_Codigo (dbo._Dic_Pantalla_Dic_Rotulo_Id(Dic_Pantalla_Id)) Pantalla_Dic_Rotulo_Codigo,
    dbo._Dic_Rotulo_Nombre (dbo._Dic_Pantalla_Dic_Rotulo_Id(Dic_Pantalla_Id)) Pantalla_Dic_Rotulo_Nombre,
	dbo._Ver_Etiqueta_Nombre1 (@p_Ver_Version_Id, dbo._Dic_Pantalla_Dic_Rotulo_Id(Dic_Pantalla_Id)) Pantalla_Ver_Etiqueta_nombre,

    -- Datos de dic_con_elemento
    dbo._Dic_Con_Elemento_Dic_Rotulo_Id(Dic_Con_Elemento_Id) Elemento_Dic_Rotulo_Id,
    dbo._Dic_Rotulo_Codigo (dbo._Dic_Con_Elemento_Dic_Rotulo_Id(Dic_Con_Elemento_Id)) Elemento_Dic_Rotulo_Codigo,
    dbo._Dic_Rotulo_Nombre (dbo._Dic_Con_Elemento_Dic_Rotulo_Id(Dic_Con_Elemento_Id)) Elemento_Dic_Rotulo_Nombre,
	dbo._Ver_Etiqueta_Nombre1 (@p_Ver_Version_Id, dbo._Dic_Con_Elemento_Dic_Rotulo_Id(Dic_Con_Elemento_Id)) Elemento_Ver_Etiqueta_nombre

FROM         Seg_Rol_Menu
where Codigo=@p_Codigo





CREATE PROCEDURE [dbo].[Seg_Menu_ByCodigo]
(
  @p_Ver_Version_Id varchar(17),
  @p_Codigo varchar(200),
  @p_Par_Servidor_Id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT     
    Id, 
    Codigo, 
    Grupo, 
    Orden, 
    Int_Usuario_Id, 
    Dic_Con_Elemento_Id, 
    Dic_Pantalla_Id, 
    Seg_Rol_Id, 
    Estado,
    
    dbo._Int_Usuario_Codigo (Int_Usuario_Id) Int_Usuario_Codigo,
    dbo._Int_Usuario_Nombre (Int_Usuario_Id) Int_Usuario_Nombre,

    dbo._Dic_Con_Elemento_Codigo (Dic_Con_Elemento_Id) Dic_Con_Elemento_Codigo,
    dbo._Dic_Con_Elemento_Nombre (Dic_Con_Elemento_Id) Dic_Con_Elemento_Nombre,

    dbo._Dic_Pantalla_Codigo  (Dic_Pantalla_Id) Dic_Pantalla_Codigo,
    dbo._Dic_Pantalla_Nombre  (Dic_Pantalla_Id) Dic_Pantalla_Nombre,

    dbo._Ver_Etiqueta_Nombre1 ( @p_Ver_Version_Id, dbo._Dic_Pantalla_Dic_Rotulo_Id(Dic_Pantalla_Id)) Pantalla_Ver_Etiqueta_Nombre ,
    dbo._Ver_Etiqueta_Imagen_Activa ( @p_Ver_Version_Id,dbo._Dic_Pantalla_Dic_Rotulo_Id(Dic_Pantalla_Id)) Pantalla_Ver_Etiqueta_Imagen_Activa,
    dbo._Ver_Etiqueta_Imagen_Desactiva (@p_Ver_Version_Id, dbo._Dic_Pantalla_Dic_Rotulo_Id(Dic_Pantalla_Id)) Pantalla_Ver_Etiqueta_Imagen_Desactiva,
    dbo._Ver_Etiqueta_Nombre1 (@p_Ver_Version_Id,dbo._Dic_Pantalla_Tool_Dic_Rotulo_Id(Dic_Pantalla_Id)) Tool_Pantalla_Ver_Etiqueta_Nombre,


    dbo._Seg_Rol_Codigo (Seg_Rol_Id) Seg_Rol_Codigo,
    dbo._Seg_Rol_Nombre (Seg_Rol_Id) Seg_Rol_Nombre,

    dbo._Dic_Con_Elemento_Dic_Contenedor_Id (Dic_Con_Elemento_Id) Dic_Contenedor_Id,
    dbo._Dic_Contenedor_Codigo (dbo._Dic_Con_Elemento_Dic_Contenedor_Id (Dic_Con_Elemento_Id))Dic_Contenedor_Codigo,
    dbo._Dic_Contenedor_Nombre (dbo._Dic_Con_Elemento_Dic_Contenedor_Id (Dic_Con_Elemento_Id))Dic_Contenedor_Nombre,

    dbo._Dic_Con_Elemento_Dic_Rotulo_Id(Dic_Con_Elemento_Id) Dic_Rotulo_id,
    dbo._Dic_Rotulo_Codigo(dbo._Dic_Con_Elemento_Dic_Rotulo_Id(Dic_Con_Elemento_Id)) Dic_Rotulo_Codigo,
    dbo._Dic_Rotulo_Nombre(dbo._Dic_Con_Elemento_Dic_Rotulo_Id(Dic_Con_Elemento_Id)) Dic_Rotulo_Nombre, 

    dbo._Ver_Etiqueta_Nombre1 ( @p_Ver_Version_Id,dbo._Dic_Con_Elemento_Dic_Rotulo_Id(Dic_Con_Elemento_Id)) Ver_Etiqueta_Nombre,
    dbo._Ver_Etiqueta_Imagen_Activa ( @p_Ver_Version_Id,dbo._Dic_Con_Elemento_Dic_Rotulo_Id(Dic_Con_Elemento_Id)) Ver_Etiqueta_Imagen_Activa,
    dbo._Ver_Etiqueta_Imagen_Desactiva (@p_Ver_Version_Id, dbo._Dic_Con_Elemento_Dic_Rotulo_Id(Dic_Con_Elemento_Id)) Ver_Etiqueta_Imagen_Desactiva,
    dbo._Ver_Etiqueta_Nombre1 (@p_Ver_Version_Id,dbo._Dic_Con_Elemento_Tool_Dic_Rotulo_Id(Dic_Con_Elemento_Id)) Tool_Ver_Etiqueta_Nombre,

    dbo._Par_Servidor_Det_Referencia (@p_Par_Servidor_Id,  dbo._Dic_Con_Elemento_Dic_Contenedor_Id (Dic_Con_Elemento_Id)) Par_Servidor_Det_Referencia,

    dbo.Estado ('SEG_MENU','ESTADO',estado, @p_Ver_Version_Id) Estado_Nombre,
    dbo.Dominio('SEG_MENU','GRUPO',grupo, @p_Ver_Version_Id) Grupo_Nombre,

    dbo._Dic_Contenedor_Tipo (dbo._Dic_Con_Elemento_Dic_Contenedor_Id (Dic_Con_Elemento_Id)) Dic_Contenedor_Tipo

FROM Seg_Menu
where Codigo=@p_Codigo














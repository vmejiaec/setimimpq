
CREATE PROCEDURE [dbo].[Seg_Rol_Elemento_ByCodigo]
(
  @p_Ver_Version_Id varchar (17),
  @p_Codigo varchar(200)
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo, 
   Estado, 
   Seg_Rol_Id, 
   Dic_Con_Elemento_Id,

   dbo.Estado ('SEG_ROL_ELEMENTO','ESTADO', Estado, @p_Ver_Version_Id) Estado_Nombre,

   dbo._Seg_Rol_Codigo (Seg_Rol_Id) Seg_Rol_Codigo,
   dbo._Seg_Rol_Nombre (Seg_Rol_Id) Seg_Rol_Nombre,

   dbo._Dic_Con_Elemento_Codigo (Dic_Con_Elemento_Id) Dic_Con_Elemento_Codigo,
   dbo._Dic_Con_Elemento_Nombre (Dic_Con_Elemento_Id) Dic_Con_Elemento_Nombre,
   
   dbo._Dic_Con_Elemento_Dic_Rotulo_Id(Dic_Con_Elemento_Id) Dic_Rotulo_Id,
   dbo._Dic_Rotulo_Codigo(dbo._Dic_Con_Elemento_Dic_Rotulo_Id(Dic_Con_Elemento_Id)) Dic_Rotulo_Codigo,
   dbo._Dic_Rotulo_Nombre(dbo._Dic_Con_Elemento_Dic_Rotulo_Id(Dic_Con_Elemento_Id)) Dic_Rotulo_Nombre, 
    
   dbo._Dic_Con_Elemento_Tool_Dic_Rotulo_Id(Dic_Con_Elemento_Id) Tool_Dic_Rotulo_Id,
   dbo._Dic_Rotulo_Codigo(dbo._Dic_Con_Elemento_Tool_Dic_Rotulo_Id(Dic_Con_Elemento_Id)) Tool_Dic_Rotulo_Codigo,
   dbo._Dic_Rotulo_Nombre(dbo._Dic_Con_Elemento_Tool_Dic_Rotulo_Id(Dic_Con_Elemento_Id)) Tool_Dic_Rotulo_Nombre,

   dbo._Dic_Con_Elemento_Dic_Contenedor_Id (Dic_Con_Elemento_Id) Dic_Contenedor_Id,
   dbo._Dic_Contenedor_Codigo (dbo._Dic_Con_Elemento_Dic_Contenedor_Id (Dic_Con_Elemento_Id)) Dic_Contenedor_Codigo,
   dbo._Dic_Contenedor_Nombre (dbo._Dic_Con_Elemento_Dic_Contenedor_Id (Dic_Con_Elemento_Id)) Dic_Contenedor_Nombre,

   -- 29 Septiembre 2008 -- Ely
   dbo._Ver_Etiqueta_Nombre1(@p_Ver_Version_Id, dbo._Dic_Con_Elemento_Dic_Rotulo_Id(Dic_Con_Elemento_Id)) Ver_Etiqueta_Nombre,
   dbo._Ver_Etiqueta_Nombre1(@p_Ver_Version_Id,dbo._Dic_Con_Elemento_Tool_Dic_Rotulo_Id(Dic_Con_Elemento_Id)) Tool_Ver_Etiqueta_Nombre	

FROM Seg_Rol_Elemento
where Codigo=@p_Codigo





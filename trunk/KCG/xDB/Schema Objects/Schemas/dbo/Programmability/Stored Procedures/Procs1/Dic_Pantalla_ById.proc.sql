CREATE PROCEDURE [dbo].[Dic_Pantalla_ById]
(
   @p_Ver_Version_id varchar (17),
   @p_Id varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT     
   Id,
   Codigo, 
   Nombre,
   Estado,
   Dic_Rotulo_Id,
   Tool_Dic_Rotulo_Id,

   dbo._Dic_Rotulo_Codigo (dic_rotulo_id) Dic_Rotulo_Codigo,
   dbo._Dic_Rotulo_Nombre (dic_rotulo_Id) Dic_Rotulo_nombre,
   dbo._Dic_Rotulo_Codigo (tool_dic_rotulo_id) Tool_Dic_Rotulo_Codigo,
   dbo._Dic_Rotulo_Nombre (tool_dic_rotulo_Id) Tool_Dic_Rotulo_Nombre, 

   dbo.Estado ('DIC_PANTALLA','ESTADO',estado, @p_ver_version_id) estado_nombre,

   -- 29 de Septiembre del 2008 -- Elhy
   dbo._Ver_Etiqueta_Nombre1(@p_Ver_Version_id, Dic_Rotulo_Id) Ver_Etiqueta_nombre,
   dbo._Ver_Etiqueta_Nombre1(@p_Ver_Version_id, Tool_Dic_Rotulo_Id) Tool_Ver_Etiqueta_nombre

FROM         Dic_Pantalla
where Id = @p_Id

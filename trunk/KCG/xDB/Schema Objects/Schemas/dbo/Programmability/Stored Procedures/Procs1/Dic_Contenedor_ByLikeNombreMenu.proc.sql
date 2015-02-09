
CREATE PROCEDURE [dbo].[Dic_Contenedor_ByLikeNombreMenu]
(
  @p_Ver_Version_Id varchar(17),
  @p_Nombre varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT     
  Id, 
   Codigo, 
   Nombre, 
   Estado, 
   Tipo, 
   Dic_Modulo_id, 
   Filtro,

   dbo.Estado ('DIC_CONTENEDOR','ESTADO', Estado, @p_Ver_Version_Id) Estado_Nombre,
   dbo.Dominio ('DIC_CONTENEDOR', 'TIPO', Tipo, @p_Ver_Version_Id) Tipo_Nombre,

   dbo._Dic_Modulo_Codigo (Dic_Modulo_id) Dic_Modulo_Codigo,
   dbo._Dic_Modulo_Nombre (Dic_Modulo_id) Dic_Modulo_Nombre,
   dbo.Dominio ('DIC_CONTENEDOR','FILTRO',Filtro, @p_Ver_Version_Id) Filtro_Nombre,

   Nombre + '.' + dbo._Ver_Version_Abreviatura(@p_Ver_Version_Id) + '.' + 'resx'Archivo_Recursos,
   
   -- 29 de Septiembre  2008 --Elhy
   dbo.Dic_Con_Elemento_Id ('MEN', Id) Menu_Dic_Con_Elemento_Id,
   dbo._Dic_Con_Elemento_Nombre (dbo.Dic_Con_Elemento_Id ('MEN', Id)) Menu_Dic_Con_Elemento_Nombre,
   dbo._Dic_Con_Elemento_Dic_Rotulo_Id (dbo.Dic_Con_Elemento_Id ('MEN', Id)) Menu_Dic_Rotulo_Id,
   dbo._Dic_Rotulo_Nombre (dbo._Dic_Con_Elemento_Dic_Rotulo_Id (dbo.Dic_Con_Elemento_Id ('MEN', Id))) Menu_Dic_Rotulo_Nombre,
   dbo._Ver_Etiqueta_Nombre1 (@p_Ver_Version_Id, dbo._Dic_Con_Elemento_Dic_Rotulo_Id (dbo.Dic_Con_Elemento_Id ('MEN', Id))) Menu_Ver_Etiqueta_Nombre

FROM  Dic_Contenedor
where upper(Nombre) like upper(@p_Nombre) and
Id in (select Dic_Contenedor_Id from Dic_Con_Elemento where Id in 
(select Dic_Con_Elemento_Id from Seg_Menu))













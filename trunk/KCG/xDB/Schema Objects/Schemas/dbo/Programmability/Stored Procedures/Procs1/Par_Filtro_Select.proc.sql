CREATE PRoCEDURE [dbo].[Par_Filtro_Select]
(
	@p_Ver_Version_Id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo, 
   Int_Usuario_Id, 
   Dic_con_Campo_Id, 
   Estado,

   dbo.Int_Usuario_Codigo (Int_Usuario_Id) Int_Usuario_Codigo,
   dbo.Int_Usuario_Nombre (Int_Usuario_Id) Int_Usuario_Nombre,

   dbo.Dic_Con_Campo_Codigo (Dic_con_Campo_Id) _Dic_Con_Campo_Codigo,
   dbo.Dic_Con_Campo_Nombre (Dic_con_Campo_Id) _Dic_Con_Campo_Nombre,
   
   dbo.Estado ('PAR_FILTRO','ESTADO', Estado, @p_ver_version_id) Estado_Nombre,
   
   dbo.Dic_Con_Campo_Dic_Con_Objet_Id (Dic_con_Campo_Id) Dic_Con_Objeto_Id,
   dbo.Dic_Con_Objeto_Codigo (dbo.Dic_Con_Campo_Dic_Con_Objet_Id (Dic_con_Campo_Id)) Dic_Con_Objeto_Codigo,
   dbo.Dic_Con_Objeto_Nombre (dbo.Dic_Con_Campo_Dic_Con_Objet_Id (Dic_con_Campo_Id)) Dic_Con_Objeto_Nombre,   

   dbo.Dic_Con_Campo_Dic_Campo_Id (Dic_con_Campo_Id) Dic_Campo_Id,
   dbo.Dic_Campo_Codigo(dbo.Dic_Con_Campo_Dic_Campo_Id (Dic_con_Campo_Id)) Dic_Campo_Codigo,
   dbo._Dic_Campo_Nombre(dbo.Dic_Con_Campo_Dic_Campo_Id (Dic_con_Campo_Id)) Dic_Campo_Nombre,

   dbo._Dic_Con_Campo_Dic_Rotulo_Id(Dic_con_Campo_Id) Dic_Rotulo_Id,
   dbo._Dic_Rotulo_Codigo(dbo._Dic_Con_Campo_Dic_Rotulo_Id(Dic_con_Campo_Id)) Dic_Rotulo_Codigo,
   dbo._Dic_Rotulo_Nombre(dbo._Dic_Con_Campo_Dic_Rotulo_Id(Dic_con_Campo_Id)) Dic_Rotulo_Nombre, 

   dbo._Dic_Con_Campo_Tool_Dic_Rotulo_Id(Dic_con_Campo_Id) Tool_dic_rotulo_id,
   dbo._Dic_Rotulo_Codigo(dbo._Dic_Con_Campo_Tool_Dic_Rotulo_Id(Dic_con_Campo_Id)) Tool_Dic_Rotulo_Codigo,
   dbo._Dic_Rotulo_Nombre(dbo._Dic_Con_Campo_Tool_Dic_Rotulo_Id(Dic_con_Campo_Id)) Tool_Dic_Rotulo_Nombre, 
   
   dbo._Dic_Campo_Tipo_Dato (dbo.Dic_Con_Campo_Dic_Campo_Id (Dic_con_Campo_Id)) Dic_Campo_Tipo_Dato,
   dbo._Dic_Campo_Tipo_Constraint (dbo.Dic_Con_Campo_Dic_Campo_Id (Dic_con_Campo_Id)) Dic_Campo_Tipo_Constraint,
   'S' Visible,
   dbo._Dic_Campo_Filtro (dbo.Dic_Con_Campo_Dic_Campo_Id (Dic_con_Campo_Id)) Dic_Campo_Filtro,
   
   dbo._Ver_Etiqueta_Nombre1 (@p_ver_version_id, dbo._Dic_Con_Campo_Dic_Rotulo_Id(Dic_con_Campo_Id)) Ver_Etiqueta_Nombre

FROM Par_Filtro
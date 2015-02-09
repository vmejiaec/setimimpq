CREATE PRoCEDURE [dbo].[Par_Filtro_ByConObjetoUsuario]
(
	@p_ver_version_id varchar (17),
	@p_dic_con_objeto_id varchar (17),
	@p_int_usuario_id varchar (17)
)
AS
	SET NOCOUNT ON;

-- Registros que se encuentran en PAR_FILTROS
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
where dbo.Dic_Con_Campo_Dic_Con_Objet_Id (Dic_con_Campo_Id) = @p_dic_con_objeto_id
and Int_Usuario_Id = @p_int_usuario_id

union

Select 

 null Id,
 null Codigo,
 @p_int_usuario_id Int_Usuario_Id,
 Id Dic_Con_Campo_Id, 
 null Estado,

 dbo.Int_Usuario_Codigo (@p_int_usuario_id) Int_Usuario_Codigo,
 dbo.Int_Usuario_Nombre (@p_int_usuario_id) Int_Usuario_Nombre,

 Codigo Dic_Con_Campo_Codigo,
 null Dic_Con_Campo_Nombre,  
 Estado Estado_Nombre,
   
 @p_dic_con_objeto_id Dic_Con_Objeto_Id,
 dbo.Dic_Con_Objeto_Codigo (@p_dic_con_objeto_id) Dic_Con_Objeto_Codigo,
 dbo.Dic_Con_Objeto_Nombre (@p_dic_con_objeto_id) Dic_Con_Objeto_Nombre,   

 dbo.Dic_Con_Campo_Dic_Campo_Id (Id)Dic_Campo_Id,
 dbo.Dic_Campo_Codigo (dbo.Dic_Con_Campo_Dic_Campo_Id (Id)) Dic_Campo_Codigo,
 dbo._Dic_Campo_Nombre (dbo.Dic_Con_Campo_Dic_Campo_Id (Id)) Dic_Campo_Nombre,

 Dic_Rotulo_Id,
 dbo._Dic_Rotulo_Codigo(Dic_Rotulo_Id) Dic_Rotulo_Codigo,
 dbo._Dic_Rotulo_Nombre(Dic_Rotulo_Id) Dic_Rotulo_Nombre, 

 Tool_Dic_Rotulo_Id,
 dbo._Dic_Rotulo_Codigo(Tool_Dic_Rotulo_Id) Tool_Dic_Rotulo_Codigo,
 dbo._Dic_Rotulo_Nombre(Tool_Dic_Rotulo_Id) Tool_Dic_Rotulo_Nombre, 
   
 dbo._Dic_Campo_Tipo_Dato (dbo.Dic_Con_Campo_Dic_Campo_Id (Id)) Dic_Campo_Tipo_dato,
 dbo._Dic_Campo_Tipo_Constraint (dbo.Dic_Con_Campo_Dic_Campo_Id (Id)) Dic_Campo_Tipo_constraint,
 'N' Visible,
 dbo._Dic_Campo_Filtro (dbo.Dic_Con_Campo_Dic_Campo_Id (Id)) Dic_Campo_Filtro,

 dbo._Ver_Etiqueta_Nombre1 (@p_ver_version_id, Dic_Rotulo_Id) Ver_Etiqueta_Nombre

from Dic_Con_Campo
where dbo.Dic_Con_Campo_Dic_Con_Objet_Id (Id)= @p_dic_con_objeto_id
and Id not in (select Dic_con_Campo_Id from Par_Filtro where Int_Usuario_Id = @p_int_usuario_id)
and dbo._Dic_Campo_Filtro (dbo.Dic_Con_Campo_Dic_Campo_Id (Id)) = 'S'

ORDER BY dbo._Dic_Campo_Tipo_Dato (dbo.Dic_Con_Campo_Dic_Campo_Id (Dic_con_Campo_Id)) DESC



























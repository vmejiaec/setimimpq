CREATE PROCEDURE [dbo].[Par_Servidor_Det_ByContenedor]
(
  @p_ver_version_id varchar (17),
  @p_dic_contenedor_id varchar (17) 
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo, 
   Estado, 
   Par_Servidor_Id, 
   Dic_Contenedor_Id, 
   Referencia,
   dbo.Estado ('PAR_SERVIDOR_DET','ESTADO',estado, @p_ver_version_id ) Estado_Nombre,
   dbo._Par_Servidor_Codigo (par_servidor_id) par_servidor_codigo,
   dbo._Par_Servidor_Nombre (par_servidor_id) par_servidor_nombre,
   dbo._Dic_Contenedor_Codigo (dic_contenedor_id) dic_contenedor_codigo,
   dbo._Dic_Contenedor_Nombre (dic_contenedor_id) dic_contenedor_nombre,

   dbo._Dic_Contenedor_Dic_Modulo_Id(Dic_Contenedor_Id) Dic_Modulo_id,
   dbo._Dic_Modulo_Codigo(dbo._Dic_Contenedor_Dic_Modulo_Id(Dic_Contenedor_Id)) Dic_Modulo_Codigo,
   dbo._Dic_Modulo_Nombre(dbo._Dic_Contenedor_Dic_Modulo_Id(Dic_Contenedor_Id)) Dic_Modulo_Nombre

FROM         Par_Servidor_Det
Where dic_contenedor_id = @p_dic_contenedor_id




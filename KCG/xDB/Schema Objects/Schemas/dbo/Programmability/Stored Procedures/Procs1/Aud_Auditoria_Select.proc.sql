CREATE PROCEDURE [dbo].[Aud_Auditoria_Select]
(
  @p_Ver_Version_Id varchar(17),
  @p_Id_Inicial varchar (17),
  @p_Id_Final varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo,
   Nombre, 
   Accion, 
   Fecha, 
   Id_Origen, 
   Codigo_Origen,
   Seg_Rol_Id,
   Dic_Objeto_Id,
   Int_Usuario_Id,
   Dic_Contenedor_Id,
   Int_Sucursal_Id, 
   Campos, 
   Estado,

   
   dbo._Dic_Objeto_Codigo (dic_objeto_id) Dic_Objeto_Codigo,
   dbo._Dic_Objeto_Nombre (dic_objeto_id) Dic_objeto_Nombre,
   dbo._Dic_Objeto_Dic_Modulo_Id (Dic_Objeto_Id) Objeto_Dic_Modulo_Id,
   dbo._Dic_Modulo_Codigo (dbo._Dic_Objeto_Dic_Modulo_Id (Dic_Objeto_Id)) Objeto_Dic_modulo_codigo,
   dbo._Dic_Modulo_Nombre (dbo._Dic_Objeto_Dic_Modulo_Id (Dic_Objeto_Id)) Objeto_Dic_modulo_nombre,
   dbo._Seg_Rol_Codigo (seg_rol_id) Seg_Rol_Codigo,
   dbo._Seg_Rol_Nombre (seg_rol_id) Seg_Rol_Nombre,
   dbo._Int_Usuario_Codigo (int_usuario_id) Int_Usuario_Codigo,
   dbo._Int_Usuario_Nombre (int_usuario_id) Int_Usuario_Nombre,

   dbo._Int_Sucursal_Codigo (Int_Sucursal_Id) Int_Sucursal_codigo,
   dbo._Int_Sucursal_Nombre (Int_Sucursal_Id) Int_Sucursal_nombre,
   dbo._Int_Sucursal_Int_Empresa_Id (Int_Sucursal_Id) int_empresa_id,
   dbo._Int_Empresa_Codigo (dbo._Int_Sucursal_Int_Empresa_Id (Int_Sucursal_Id)) int_empresa_codigo,
   dbo._Int_Empresa_Nombre (dbo._Int_Sucursal_Int_Empresa_Id (Int_Sucursal_Id)) int_empresa_nombre,
   dbo._Int_Sucursal_Int_Moneda_Id(Int_Sucursal_Id) Int_Moneda_Id,
   dbo._Int_Moneda_Codigo(dbo._Int_Sucursal_Int_Moneda_Id(Int_Sucursal_Id)) Int_Moneda_Codigo,
   dbo._Int_Moneda_Nombre(dbo._Int_Sucursal_Int_Moneda_Id(Int_Sucursal_Id)) Int_Moneda_Nombre,

   dbo._Dic_Contenedor_Codigo (Dic_Contenedor_Id) Dic_contenedor_Codigo,
   dbo._Dic_Contenedor_Nombre (Dic_Contenedor_Id) Dic_contenedor_Nombre,
   dbo._Dic_Contenedor_Dic_Modulo_Id(Dic_Contenedor_Id) Contenedor_Dic_Modulo_Id,
   dbo._Dic_Modulo_Codigo(dbo._Dic_Contenedor_Dic_Modulo_Id(Dic_Contenedor_Id)) Contenedor_Dic_modulo_codigo,
   dbo._Dic_Modulo_Nombre(dbo._Dic_Contenedor_Dic_Modulo_Id(Dic_Contenedor_Id)) Contenedor_Dic_modulo_nombre,
       

   dbo.Dominio('AUD_AUDITORIA','ACCION', accion, @p_ver_version_id) Accion_Nombre,
   dbo.Estado('AUD_AUDITORIA','ESTADO',estado, @p_ver_version_id) estado_Nombre
FROM         Aud_Auditoria
where Id >= @p_id_inicial 
and   Id <= @p_id_final












CREATE PROCEDURE [dbo].[Aud_Log_ByEmpresa]
(
  @p_Ver_Version_Id varchar(17),
  @p_par_servidor_id varchar(17),
  @p_dic_Objeto_id varchar(17),
  @p_secuencia int,
  @p_Int_Empresa_Id varchar (17)  
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo, 
   Fecha, 
   Accion,
   Dic_Contenedor_Id,   
   Int_Sucursal_Id, 
   Seg_Rol_Id,
   Int_Usuario_Id,
   Ver_Version_Id,  
   Par_Mensaje_Id,
   Procedimiento,
   Parametros,
   Datos,
   Estado,
   
   
   dbo._Dic_Contenedor_Codigo (Dic_Contenedor_Id) Dic_Contenedor_Codigo,
   dbo._Dic_Contenedor_Nombre (Dic_Contenedor_Id) Dic_Contenedor_Nombre,
   dbo._Dic_Contenedor_Dic_Modulo_Id(Dic_Contenedor_id) Dic_Modulo_id,
   dbo._Dic_Modulo_Codigo(dbo._Dic_Contenedor_Dic_Modulo_Id(Dic_Contenedor_id)) Dic_Modulo_Codigo,
   dbo._Dic_Modulo_Nombre(dbo._Dic_Contenedor_Dic_Modulo_Id(Dic_Contenedor_id)) Dic_Modulo_Nombre,

   dbo._Int_Sucursal_Codigo (int_sucursal_Id) Int_Sucursal_Codigo,
   dbo._Int_Sucursal_Nombre (int_sucursal_id) Int_Sucursal_Nombre,
   dbo._Int_Sucursal_Int_Empresa_Id (int_sucursal_id) Int_empresa_Id,
   dbo._Int_Empresa_Codigo (dbo._Int_Sucursal_Int_Empresa_Id (int_sucursal_id)) int_empresa_codigo,
   dbo._Int_Empresa_Nombre (dbo._Int_Sucursal_Int_Empresa_Id (int_sucursal_id)) int_empresa_nombre,
   dbo._Int_Sucursal_Int_Moneda_Id(Int_Sucursal_Id) Int_moneda_id,
   dbo._Int_Moneda_Codigo(dbo._Int_Sucursal_Int_Moneda_Id(Int_Sucursal_Id)) Int_Moneda_Codigo,
   dbo._Int_Moneda_Nombre(dbo._Int_Sucursal_Int_Moneda_Id(Int_Sucursal_Id)) Int_Moneda_Nombre,
   
   dbo._Seg_Rol_Codigo (seg_rol_id) seg_rol_codigo,
   dbo._Seg_Rol_Nombre (seg_rol_id) seg_rol_nombre,

   dbo._Int_Usuario_Codigo (int_Usuario_Id) Int_Usuario_Codigo,
   dbo._Int_Usuario_Nombre (int_Usuario_Id) Int_Usuario_Nombre,
   dbo._Int_Usuario_Per_Personal_Id (int_Usuario_Id) Per_Personal_Id,
   dbo._Per_Personal_Codigo(dbo._Int_Usuario_Per_Personal_Id (int_Usuario_Id)) Per_Personal_Codigo,
   dbo._Per_Personal_Nombre(dbo._Int_Usuario_Per_Personal_Id (int_Usuario_Id)) Per_Personal_Nombre,
   
   dbo._Ver_Version_Codigo (ver_version_id) ver_version_codigo,
   dbo._Ver_Version_Nombre (ver_version_id) Ver_version_Nombre,

   dbo._Par_Mensaje_Codigo (Par_Mensaje_Id) par_mensaje_codigo,
   dbo._Par_Mensaje_Nombre (Par_Mensaje_Id) par_mensaje_nombre,
   
   dbo.Dominio('AUD_LOG','ACCION', accion, @p_ver_version_id) Accion_Nombre,
   dbo.Estado ('AUD_LOG','ESTADO', estado , @p_ver_version_id ) estado_Nombre 
FROM  Aud_Log
Where dbo._Int_Sucursal_Int_Empresa_Id (int_sucursal_id) = @p_int_empresa_id
and  dbo._Dic_Paginacion_Inicial(@p_par_servidor_id,@p_dic_objeto_id,@p_secuencia) >= id
and  dbo._Dic_Paginacion_Final(@p_par_servidor_id,@p_dic_objeto_id,@p_secuencia) < id



















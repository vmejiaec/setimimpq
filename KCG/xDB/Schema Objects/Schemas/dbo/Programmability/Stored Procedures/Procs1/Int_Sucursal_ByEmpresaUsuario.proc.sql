CREATE PROCEDURE [dbo].[Int_Sucursal_ByEmpresaUsuario]
(
   @p_Ver_Version_Id varchar (17),
   @p_Int_Empresa_Id varchar (17),
   @p_Int_Usuario_Id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo, 
   Nombre, 
   Abreviatura, 
   Numero, 
   Predeterminada,
   Int_Empresa_Id, 
   Int_Moneda_Id, 
   Descripcion, 
   Estado,

   dbo._Int_Empresa_Codigo (Int_Empresa_Id) Int_empresa_Codigo,
   dbo._Int_Empresa_Nombre (Int_Empresa_Id) Int_Empresa_nombre,
 
   dbo._Int_Empresa_Imagen (Int_Empresa_Id) Int_Empresa_Imagen,

   dbo._Int_Moneda_Codigo (Int_Moneda_Id) Int_Moneda_Codigo,
   dbo._Int_Moneda_Nombre (int_Moneda_Id) Int_Moneda_Nombre,

   dbo.Estado ('INT_SUCURSAL','ESTADO', estado, @p_ver_version_id) Estado_Nombre,

   dbo._Int_Empresa_Abreviatura (Int_Empresa_Id) Int_Empresa_Abreviatura

FROM   Int_Sucursal
WHERE  int_empresa_id = @p_int_empresa_id
       and int_sucursal.id in
          (select seg_rol_usuario_det.int_sucursal_id 
           from seg_rol_usuario_det
           where seg_rol_usuario_det.seg_rol_usuario_id in 
                 (select seg_rol_usuario.id 
                  from seg_rol_usuario
                  where int_usuario_id = @p_int_usuario_id))






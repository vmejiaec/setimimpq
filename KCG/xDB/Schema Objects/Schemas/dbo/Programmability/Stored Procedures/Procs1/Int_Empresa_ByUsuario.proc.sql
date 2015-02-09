CREATE PROCEDURE [dbo].[Int_Empresa_ByUsuario]
(
  @p_Ver_Version_Id varchar(17),
  @p_Int_Usuario_Id varchar(17)
)
AS
	SET NOCOUNT ON;

SELECT     
   Id, 
   Codigo, 
   Abreviatura, 
   Nombre, 
   Imagen,
   Descripcion,
   Estado,
   Plan_Cuenta,
   Direccion,
   dbo.Estado ('INT_EMPRESA','ESTADO', Estado, @p_Ver_Version_Id) Estado_Nombre
FROM         Int_Empresa
where int_empresa.id in
  (select int_sucursal.int_empresa_id 
   from int_sucursal
   where int_sucursal.id in
       (select seg_rol_usuario_det.int_sucursal_id 
        from seg_rol_usuario_det
        where seg_rol_usuario_det.seg_rol_usuario_id in 
           (select seg_rol_usuario.id 
            from seg_rol_usuario
            where int_usuario_id = @p_int_usuario_id
            )
        )
   )









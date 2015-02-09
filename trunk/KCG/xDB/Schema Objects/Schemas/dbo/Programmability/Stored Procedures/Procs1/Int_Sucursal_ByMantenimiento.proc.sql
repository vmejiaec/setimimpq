CREATE PROCEDURE [dbo].[Int_Sucursal_ByMantenimiento]
(
   @p_ver_version_Id varchar (17),
   @p_int_empresa_id varchar (17)
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
where 
   id not in (select int_sucursal_id from aud_par_log)
or id not in (select int_sucursal_id from aud_par_auditoria)






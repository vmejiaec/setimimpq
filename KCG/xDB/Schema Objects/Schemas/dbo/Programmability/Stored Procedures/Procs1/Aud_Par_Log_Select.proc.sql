CREATE PROCEDURE [dbo].[Aud_Par_Log_Select]
(
    @p_Ver_Version_Id varchar(17)
)			
AS
	SET NOCOUNT ON;
SELECT     
    Id, 
    Codigo, 
    Int_Sucursal_Id,
    Dic_Contenedor_Id,
    ERR,
    USR,
    DDL,
    EJE, 
    Estado, 

    dbo._Dic_Contenedor_Codigo (Dic_Contenedor_Id) Dic_Contenedor_Codigo,
    dbo._Dic_Contenedor_Nombre (Dic_contenedor_Id) Dic_contenedor_Nombre,
    dbo._Dic_Contenedor_Dic_Modulo_Id (Dic_Contenedor_id) Dic_Modulo_Id,
    dbo._Dic_Modulo_Codigo ( dbo._Dic_Contenedor_Dic_Modulo_Id (Dic_Contenedor_id)) Dic_Modulo_Codigo,
    dbo._Dic_Modulo_Nombre ( dbo._Dic_Contenedor_Dic_Modulo_Id (Dic_Contenedor_id)) Dic_Modulo_Nombre,
    dbo._Int_Sucursal_Codigo (Int_sucursal_id) Int_sucursal_Codigo,
    dbo._Int_Sucursal_Nombre (int_sucursal_id) Int_Sucursal_Nombre,
    dbo._Int_Sucursal_Int_Empresa_Id (int_sucursal_id) Int_empresa_Id,
    dbo._Int_Empresa_Codigo (dbo._Int_Sucursal_Int_Empresa_Id (int_sucursal_id)) Int_Empresa_Codigo,
    dbo._Int_Empresa_Nombre (dbo._Int_Sucursal_Int_Empresa_Id (int_sucursal_id)) Int_Empresa_Nombre,
    dbo._Int_Sucursal_Int_Moneda_Id(int_sucursal_id) Int_moneda_id,
    dbo._Int_Moneda_Codigo(dbo._Int_Sucursal_Int_Moneda_Id(int_sucursal_id)) Int_Moneda_Codigo,
    dbo._Int_Moneda_Nombre(dbo._Int_Sucursal_Int_Moneda_Id(int_sucursal_id)) Int_Moneda_Nombre,
  
    dbo.Dominio('AUD_PAR_LOG','ERR', ERR, @p_ver_version_id) ERR_Nombre,
    dbo.Dominio('AUD_PAR_LOG','USR', USR, @p_ver_version_id) USR_Nombre,
    dbo.Dominio('AUD_PAR_LOG','DDL', DDL, @p_ver_version_id) DDL_Nombre,
    dbo.Dominio('AUD_PAR_LOG','EJE', EJE, @p_ver_version_id) EJE_Nombre,
    dbo.Estado('AUD_PAR_LOG','ESTADO',estado, @p_ver_version_id) Estado_nombre
FROM         Aud_Par_Log










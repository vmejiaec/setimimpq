CREATE PROCEDURE [dbo].[Aud_Par_Auditoria_ByCodigo]
(
  @p_Ver_Version_Id varchar(17),
  @p_Codigo varchar(200)
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo, 
   Int_Sucursal_Id, 
   Dic_Objeto_Id, 
   INS,
   UPD,
   DEL,
   UNI,
   SEL,
   BIN,
   BUP,
   BDE,
   estado,
 
   dbo._Int_Sucursal_Codigo (Int_sucursal_id) Int_sucursal_Codigo,
   dbo._Int_Sucursal_Nombre (int_sucursal_id) Int_Sucursal_Nombre,
   dbo._Int_Sucursal_Int_Empresa_Id (int_sucursal_id) Int_empresa_Id,
   dbo._Int_Empresa_Codigo (dbo._Int_Sucursal_Int_Empresa_Id (int_sucursal_id)) Int_Empresa_Codigo,
   dbo._Int_Empresa_Nombre (dbo._Int_Sucursal_Int_Empresa_Id (int_sucursal_id)) Int_Empresa_Nombre,
   dbo._Dic_Objeto_Codigo (Dic_Objeto_Id) Dic_Objeto_Codigo,
   dbo._Dic_Objeto_Nombre (Dic_Objeto_Id) Dic_Objeto_Nombre,
   dbo._Dic_Objeto_Dic_Modulo_Id (dic_Objeto_id) Dic_Modulo_Id,
   dbo._Dic_Modulo_Codigo (dbo._Dic_Objeto_Dic_Modulo_Id (Dic_Objeto_Id)) Dic_Modulo_Codigo,
   dbo._Dic_Modulo_Nombre (dbo._Dic_Objeto_Dic_Modulo_Id (Dic_Objeto_Id)) Dic_Modulo_Nombre,
   dbo._Int_Sucursal_Int_Moneda_Id(Int_Sucursal_Id) Int_Moneda_id,
   dbo._Int_Moneda_Codigo(dbo._Int_Sucursal_Int_Moneda_Id(Int_Sucursal_Id)) Int_Moneda_Codigo,
   dbo._Int_Moneda_Nombre(dbo._Int_Sucursal_Int_Moneda_Id(Int_Sucursal_Id)) Int_Moneda_Nombre,       
   
   dbo.Dominio('AUD_PAR_AUDITORIA','INS', INS, @p_ver_version_id) INS_Nombre,
   dbo.Dominio('AUD_PAR_AUDITORIA','UPD', UPD, @p_ver_version_id) UPD_Nombre,
   dbo.Dominio('AUD_PAR_AUDITORIA','DEL', DEL, @p_ver_version_id) DEL_Nombre,
   dbo.Dominio('AUD_PAR_AUDITORIA','UNI', UNI, @p_ver_version_id) UNI_Nombre,
   dbo.Dominio('AUD_PAR_AUDITORIA','SEL', SEL, @p_ver_version_id) SEL_Nombre,
   dbo.Dominio('AUD_PAR_AUDITORIA','BIN', BIN, @p_ver_version_id) BIN_Nombre,
   dbo.Dominio('AUD_PAR_AUDITORIA','BUP', BUP, @p_ver_version_id) BUP_Nombre,
   dbo.Dominio('AUD_PAR_AUDITORIA','BDE', BDE, @p_ver_version_id) BDE_Nombre,
   dbo.Estado ('AUD_PAR_AUDITORIA','ESTADO',estado, @p_ver_version_id) Estado_Nombre
FROM         Aud_Par_Auditoria
where Codigo=@p_Codigo








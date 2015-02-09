
CREATE PROCEDURE [dbo].[Par_Razon_Social_Select]
(
   @p_ver_version_id varchar (17) 
)
AS
	SET NOCOUNT ON;
SELECT     
    Id,
    Codigo,
    Par_Tipo_Identificacion_Id,
    Numero,
    Nombre,
    Nombre_Comercial, 
    Int_Empresa_Id,
    Estado,

    dbo.Int_Empresa_Codigo(Int_Empresa_Id) Int_Empresa_Codigo,
    dbo.Int_Empresa_Nombre(Int_Empresa_Id) Int_Empresa_Nombre,

    dbo.Par_Tipo_Identificacion_Codigo(Par_Tipo_Identificacion_Id) Par_Tipo_Identificacion_Codigo,
    dbo.Par_Tipo_Identificacion_Nombre(Par_Tipo_Identificacion_Id) Par_Tipo_Identificacion_Nombre,
	dbo.Par_Tipo_Identificacion_Cedula(Par_Tipo_Identificacion_Id) Par_Tipo_Identificacion_Cedula,

    dbo.Estado('PAR_RAZON_SOCIAL','ESTADO', Estado, @p_ver_version_id) Estado_Nombre

FROM Par_Razon_Social







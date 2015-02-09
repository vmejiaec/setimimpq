
CREATE PROCEDURE [dbo].[Par_Razon_Social_ByLikeNombre]
(
  @p_ver_version_id varchar (17),
  @p_Int_Empresa_Id varchar (17),
  @p_Par_Tipo_Identificacion_Id varchar (17),
  @p_Nombre varchar(500)
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
WHERE Int_Empresa_Id = @p_Int_Empresa_Id and 
      Par_Tipo_Identificacion_Id = @p_Par_Tipo_Identificacion_Id and
	  upper(Nombre) like (upper(@p_Nombre))











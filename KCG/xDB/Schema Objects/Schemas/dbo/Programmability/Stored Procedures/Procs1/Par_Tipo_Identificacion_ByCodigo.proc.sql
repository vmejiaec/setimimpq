
CREATE PROCEDURE [dbo].[Par_Tipo_Identificacion_ByCodigo]
(
   @p_Ver_Version_id varchar (17),
   @p_Codigo varchar (200)
)
AS
	SET NOCOUNT ON;
SELECT 
    Id,
    Codigo,
    Nombre,
    Int_Empresa_Id,
	Cedula,
    Descripcion,
    Estado,
    
    dbo.Int_Empresa_Codigo (Int_Empresa_Id) Int_Empresa_Codigo,
    dbo.Int_Empresa_Nombre (Int_Empresa_Id) Int_Empresa_Nombre,
	dbo.Dominio ('PAR_TIPO_IDENTIFICACION','CEDULA', Cedula, @p_Ver_Version_id) Cedula_Nombre,
    dbo.Estado ('PAR_TIPO_IDENTIFICACION','ESTADO', Estado, @p_Ver_Version_id) Estado_Nombre

FROM Par_Tipo_Identificacion
WHERE Codigo = @p_Codigo





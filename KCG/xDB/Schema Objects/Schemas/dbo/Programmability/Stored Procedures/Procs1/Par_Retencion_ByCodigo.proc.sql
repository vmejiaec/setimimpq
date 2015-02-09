CREATE PROCEDURE [dbo].[Par_Retencion_ByCodigo]
(
	@p_Ver_Version_Id VARCHAR(17),
	@p_Codigo VARCHAR(17)
)
AS
	SET NOCOUNT ON;
SELECT     
	Id, 
	Codigo, 
	Nombre, 
	Int_Empresa_Id, 
	Valor, 
	Descripcion, 
	Estado,

	dbo.Int_Empresa_Codigo(Int_Empresa_Id) Int_Empresa_Codigo,
	dbo.Int_Empresa_Nombre(Int_Empresa_Id) Int_Empresa_Nombre,

	dbo.Estado('PAR_RETENCION','ESTADO', Estado, @p_Ver_Version_Id) Estado_Nombre
	
FROM Par_Retencion
WHERE Codigo = @p_Codigo
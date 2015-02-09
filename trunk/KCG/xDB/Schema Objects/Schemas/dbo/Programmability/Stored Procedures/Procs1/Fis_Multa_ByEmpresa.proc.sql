CREATE PROCEDURE [dbo].[Fis_Multa_ByEmpresa]
(
	@p_Ver_Version_Id varchar(17),
	@p_Int_Empresa_Id varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT				
			Id, 
			Codigo, 
			Nombre, 
			Estado, 
			Descripcion,
			Int_Empresa_Id,
			
			dbo._Int_Empresa_Codigo (Int_Empresa_Id) Int_Empresa_Codigo,
			dbo._Int_Empresa_Nombre (Int_Empresa_Id) Int_Empresa_Nombre,

			dbo.Estado ('FIS_MULTA','ESTADO',Estado, @p_Ver_Version_Id) Estado_Nombre
FROM         Fis_Multa
where Int_Empresa_Id like @p_Int_Empresa_Id
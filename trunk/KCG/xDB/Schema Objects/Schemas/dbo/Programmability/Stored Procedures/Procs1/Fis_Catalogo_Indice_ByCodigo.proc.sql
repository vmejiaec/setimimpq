CREATE PROCEDURE [dbo].[Fis_Catalogo_Indice_ByCodigo]
(
	@p_Ver_Version_Id varchar(17),
	@p_Codigo varchar(200)
)
AS
	SET NOCOUNT ON;
SELECT     
	Id, 
	Codigo, 
	Estado, 
	Descripcion, 
	Fis_Catalogo_Id, 
	Apu_Indice_Id, 
	Valor,

	dbo.Fis_Catalogo_Nombre(Fis_Catalogo_Id) Fis_Catalogo_Nombre,
	dbo.Fis_Catalogo_Codigo(Fis_Catalogo_Id) Fis_Catalogo_Codigo,

	dbo._Apu_Indice_Nombre(Apu_Indice_Id) Apu_Indice_Nombre,
	dbo._Apu_Indice_Codigo(Apu_Indice_Id) Apu_Indice_Codigo,

	dbo.Estado ('FIS_CATALOGO_INDICE','ESTADO',Estado, @p_Ver_Version_Id) Estado_Nombre

FROM         Fis_Catalogo_Indice
where Codigo = @p_Codigo
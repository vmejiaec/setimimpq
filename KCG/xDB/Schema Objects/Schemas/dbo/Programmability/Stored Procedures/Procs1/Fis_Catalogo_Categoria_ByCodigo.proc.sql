CREATE PROCEDURE [dbo].[Fis_Catalogo_Categoria_ByCodigo]
(
	@p_Ver_Version_Id varchar(17),
	@p_Codigo varchar(200)
)
AS
	SET NOCOUNT ON;
SELECT     
	Id, 
	Codigo, 
	Fis_Catalogo_Id, 
	Apu_Categoria_Id, 
	Valor, 
	Estado, 
	Descripcion,

	dbo.Fis_Catalogo_Nombre(Fis_Catalogo_Id) Fis_Catalogo_Nombre,
	dbo.Fis_Catalogo_Codigo(Fis_Catalogo_Id) Fis_Catalogo_Codigo,

	dbo._Apu_Categoria_Nombre(Apu_Categoria_Id) Apu_Categoria_Nombre,
	dbo._Apu_Categoria_Codigo(Apu_Categoria_Id) Apu_Categoria_Codigo,

	dbo.Estado ('FIS_CATALOGO_CATEGORIA','ESTADO',Estado, @p_Ver_Version_Id) Estado_Nombre
FROM         Fis_Catalogo_Categoria
where Codigo = @p_Codigo
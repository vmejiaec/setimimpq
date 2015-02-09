CREATE PROCEDURE [dbo].[Fis_Catalogo_Mano_Obra_ById]
(
	@p_Ver_Version_Id VARCHAR(17),
	@p_Id VARCHAR(17)
)
AS
	SET NOCOUNT ON;
SELECT        
	Id, 
	Codigo, 
	Fis_Catalogo_Id, 
	Apu_Categoria_Id, 
	Apu_Mano_Obra_Id, 
	Valor, 
	Estado, 
	Descripcion,
	
	dbo.Fis_Catalogo_Codigo (Fis_Catalogo_Id) Fis_Catalogo_Codigo,
	dbo.Fis_Catalogo_Nombre (Fis_Catalogo_Id) Fis_Catalogo_Nombre,
	dbo.Fis_Catalogo_Fecha_Publicacion (Fis_Catalogo_Id) Fis_Catalogo_Fecha_Publicacion,
	dbo.Fis_Catalogo_Fecha_Creacion (Fis_Catalogo_Id) Fis_Catalogo_Fecha_Creacion,

	dbo._Apu_Categoria_Codigo (Apu_Categoria_Id) Apu_Categoria_Codigo,
	dbo._Apu_Categoria_Nombre (Apu_Categoria_Id) Apu_Categoria_Nombre,
	
	dbo._Apu_Mano_Obra_Codigo (Apu_Mano_Obra_Id) Apu_Mano_Obra_Codigo,
	dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) Apu_Mano_Obra_Nombre,

	dbo.Fis_Catalogo_Categoria_Valor (Apu_Categoria_Id, Fis_Catalogo_Id) Fis_Catalogo_Categoria_Valor,
	dbo.Fis_Catalogo_CMO_Valor (Apu_Categoria_Id, Fis_Catalogo_Id, Valor) Fis_Catalogo_CMO_Valor,

	dbo.Estado ('FIS_CATALOGO_CATEGORIA_MANO_OBRA', 'ESTADO', Estado, @p_Ver_Version_Id) Estado_Nombre	

FROM Fis_Catalogo_Mano_Obra
WHERE Id = @p_Id
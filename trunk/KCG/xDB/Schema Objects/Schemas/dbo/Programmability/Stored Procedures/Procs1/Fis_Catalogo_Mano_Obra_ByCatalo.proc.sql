CREATE PROCEDURE [dbo].[Fis_Catalogo_Mano_Obra_ByCatalo]
(
	--Parámetros Fijos
	@p_Ver_Version_Id VARCHAR(17),
	@p_Fis_Catalogo_Id VARCHAR(17),
	--Parámetros Opcionales
	@p_Apu_Categoria_Codigo_Desde VARCHAR(200),
	@p_Apu_Categoria_Codigo_Hasta VARCHAR(200),
	@p_Apu_Categoria_Nombre VARCHAR(500),
	@p_Apu_Mano_Obra_Codigo_Desde VARCHAR(200),
	@p_Apu_Mano_Obra_Codigo_Hasta VARCHAR(200),
	@p_Apu_Mano_Obra_Nombre VARCHAR(500),
	@p_Fis_Catalogo_CMO_Valor_Desde NUMERIC(17,2),
	@p_Fis_Catalogo_CMO_Valor_Hasta NUMERIC(17,2),
	--Parámetros de Paginación
	@p_Numero_Registros INT,
    @p_Pagina_Actual INT
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

FROM
(
	SELECT 
		Id, 
		Codigo, 
		Fis_Catalogo_Id, 
		Apu_Categoria_Id, 
		Apu_Mano_Obra_Id, 
		Valor, 
		Estado, 
		Descripcion,
		
		ROW_NUMBER() OVER (ORDER BY dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id)) AS RowNumber
		
	FROM Fis_Catalogo_Mano_Obra
	WHERE Fis_Catalogo_Id = @p_Fis_Catalogo_Id
	AND (dbo._Apu_Categoria_Codigo (Apu_Categoria_Id) IS NULL OR dbo._Apu_Categoria_Codigo (Apu_Categoria_Id) 		
		BETWEEN convert(numeric,@p_Apu_Categoria_Codigo_Desde) AND convert(numeric,@p_Apu_Categoria_Codigo_Hasta))
	AND (@p_Apu_Categoria_Nombre = '%' or dbo._Apu_Categoria_Nombre (Apu_Categoria_Id) LIKE @p_Apu_Categoria_Nombre)
	AND dbo._Apu_Mano_Obra_Codigo (Apu_Mano_Obra_Id)
		BETWEEN convert(numeric,@p_Apu_Mano_Obra_Codigo_Desde) AND convert(numeric,@p_Apu_Mano_Obra_Codigo_Hasta)
	AND dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) LIKE @p_Apu_Mano_Obra_Nombre
	AND dbo.Fis_Catalogo_CMO_Valor (Apu_Categoria_Id, Fis_Catalogo_Id, Valor)
		BETWEEN @p_Fis_Catalogo_CMO_Valor_Desde AND @p_Fis_Catalogo_CMO_Valor_Hasta

) Fis_Catalogo_Mano_Obra
WHERE RowNumber > (@p_Numero_Registros * (@p_Pagina_Actual-1)) 
AND RowNumber <= (@p_Numero_Registros * (@p_Pagina_Actual))
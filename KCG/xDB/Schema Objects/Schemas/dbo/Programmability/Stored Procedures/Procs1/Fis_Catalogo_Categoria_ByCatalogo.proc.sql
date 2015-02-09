
CREATE PROCEDURE [dbo].[Fis_Catalogo_Categoria_ByCatalogo]
(
	-- Parámetros Obligatorios
	@p_Ver_Version_Id varchar(17),
	@p_Fis_Catalogo_Id varchar(17),
	-- Parámetros Opcionales
	@p_Apu_Categoria_Codigo_Desde varchar(200),
	@p_Apu_Categoria_Codigo_Hasta varchar(200),
	@p_Apu_Categoria_Nombre  varchar(500),
	@p_Valor_Desde numeric(17,3),
	@p_Valor_Hasta numeric(17,3),
	-- Parámetros Paginación
	@p_Pagina_Actual INT,
	@p_Numero_Registros INT

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
FROM 
(
	SELECT

			Id, 
			Codigo, 
			Estado, 
			Descripcion, 
			Fis_Catalogo_Id, 
			Apu_Categoria_Id, 
			Valor,
			ROW_NUMBER() OVER (ORDER BY dbo._Apu_Categoria_Nombre(Apu_Categoria_Id)) AS RowNumber
	FROM Fis_Catalogo_Categoria
	WHERE 
			Fis_Catalogo_Id = @p_Fis_Catalogo_Id
	AND	Convert(numeric,dbo._Apu_Categoria_Codigo(Apu_Categoria_Id)) between Convert(numeric,	@p_Apu_Categoria_Codigo_Desde) and Convert(numeric,@p_Apu_Categoria_Codigo_Hasta) 
	AND dbo._Apu_Categoria_Nombre(Apu_Categoria_Id) like @p_Apu_Categoria_Nombre
	AND Valor between @p_Valor_Desde and @p_Valor_Hasta

)   Fis_Catalogo_Categoria
WHERE RowNumber > (@p_Numero_Registros * (@p_Pagina_Actual-1)) 
AND RowNumber <= (@p_Numero_Registros * (@p_Pagina_Actual))
order by dbo._Apu_Categoria_Nombre(Apu_Categoria_Id)
CREATE PROCEDURE [dbo].[Fis_Catalogo_Categoria_ByTotalPaginas]
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
	@p_Numero_Registros INT
)
AS
	SET NOCOUNT ON;
SELECT	
	CASE WHEN (Count(*) % @p_Numero_Registros)>0 THEN  (Count(*) / @p_Numero_Registros) + 1 ELSE	(Count(*) / @p_Numero_Registros)  END Total_Paginas
FROM Fis_Catalogo_Categoria
WHERE 
			Fis_Catalogo_Id = @p_Fis_Catalogo_Id
	AND	Convert(numeric,dbo._Apu_Categoria_Codigo(Apu_Categoria_Id)) between Convert(numeric,	@p_Apu_Categoria_Codigo_Desde) and Convert(numeric,@p_Apu_Categoria_Codigo_Hasta) 
	AND dbo._Apu_Categoria_Nombre(Apu_Categoria_Id) like @p_Apu_Categoria_Nombre
	AND Valor between @p_Valor_Desde and @p_Valor_Hasta
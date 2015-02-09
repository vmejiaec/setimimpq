CREATE PROCEDURE [dbo].[Fis_Catalogo_Mano_Obra_ByTotPags]
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
	@p_Numero_Registros INT
)
AS
	SET NOCOUNT ON;
SELECT 
	CASE WHEN (Count(*) % @p_Numero_Registros) > 0 THEN  
			  (Count(*) / @p_Numero_Registros) + 1 ELSE	
			  (Count(*) / @p_Numero_Registros) END Total_Paginas

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
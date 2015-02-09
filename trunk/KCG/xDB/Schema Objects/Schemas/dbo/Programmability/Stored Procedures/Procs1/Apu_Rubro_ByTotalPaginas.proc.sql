CREATE PROCEDURE [dbo].[Apu_Rubro_ByTotalPaginas]
(	
	--Parámetros de Filtrado Fijo
	@p_Ver_Version_Id VARCHAR(17),
	@p_Int_Sucursal_Id VARCHAR(17),
	--Parámetros de Filtrado Opcional
	@p_Codigo_Desde VARCHAR(200),
	@p_Codigo_Hasta VARCHAR(200),
	@p_Nombre VARCHAR(500),
	@p_Apu_Subtitulo_Codigo_Desde VARCHAR(200),
	@p_Apu_Subtitulo_Codigo_Hasta VARCHAR(200),
	@p_Apu_Subtitulo_Nombre VARCHAR(500),
	@p_Apu_Titulo_Codigo_Desde VARCHAR(200),
	@p_Apu_Titulo_Codigo_Hasta VARCHAR(200),
	@p_Apu_Titulo_Nombre VARCHAR(500),
	--Parámetros de Paginación
	@p_Numero_Registros INT
)
AS
	SET NOCOUNT ON;

SELECT 
 CASE WHEN (Count(*) % @p_Numero_Registros)>0 THEN  (Count(*) / @p_Numero_Registros) + 1 ELSE	(Count(*) / @p_Numero_Registros)  END Total_Paginas
FROM v_apu_rubro
WHERE Int_Sucursal_Id= @p_Int_Sucursal_Id
AND Codigo between CONVERT(NUMERIC,@p_Codigo_Desde) AND CONVERT(NUMERIC,@p_Codigo_Hasta)
AND Nombre like @p_Nombre
AND Apu_Subtitulo_Codigo between CONVERT(NUMERIC,@p_Apu_Subtitulo_Codigo_Desde) AND CONVERT(NUMERIC,@p_Apu_Subtitulo_Codigo_Hasta)
AND Apu_Subtitulo_Nombre like @p_Apu_Subtitulo_Nombre
AND Apu_Titulo_Codigo between CONVERT(NUMERIC,@p_Apu_Titulo_Codigo_Desde) AND CONVERT(NUMERIC,@p_Apu_Titulo_Codigo_Hasta)
AND Apu_Titulo_Nombre like @p_Apu_Titulo_Nombre
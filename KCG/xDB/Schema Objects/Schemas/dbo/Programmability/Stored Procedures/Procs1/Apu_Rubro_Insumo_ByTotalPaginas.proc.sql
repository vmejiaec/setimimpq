CREATE PROCEDURE [dbo].[Apu_Rubro_Insumo_ByTotalPaginas]
(
	--Parámetros de Filtrado Fijo
	@p_Ver_Version_Id VARCHAR(17),
	@p_Int_Sucursal_Id VARCHAR(17),	
	--Parámetros Opcionales
	@p_Apu_Rubro_Codigo_Desde VARCHAR(200),
	@p_Apu_Rubro_Codigo_Hasta VARCHAR(200),
	@p_Apu_Rubro_Nombre VARCHAR(500),	
	@p_Apu_Insumo_Nombre VARCHAR(500),
	@p_Tipo CHAR(3),
	@p_Apu_Subtitulo_Nombre VARCHAR(500),
	@p_Apu_Titulo_Nombre VARCHAR(500),
	--Parámetros de Paginación Fina
	@p_Numero_Registros INT
)
AS
	SET NOCOUNT ON;

if (@p_Tipo = '%') 
BEGIN
	SELECT CASE WHEN  ((Count_Material + Count_Mano_Obra+ Count_Equipo)% @p_Numero_Registros) > 0 
				THEN  ((Count_Material + Count_Mano_Obra+ Count_Equipo)/ @p_Numero_Registros) + 1
				ELSE  ((Count_Material + Count_Mano_Obra+ Count_Equipo)/ @p_Numero_Registros) END Total_Paginas
	FROM 
	( SELECT Count(*) Count_Material
	  FROM Apu_Rubro_Material 
	  WHERE (@p_Apu_Insumo_Nombre = '%' OR dbo._Apu_Material_Nombre (Apu_Material_Id) like @p_Apu_Insumo_Nombre)
	  AND dbo._Apu_Rubro_Codigo(Apu_Rubro_Id) 
		  BETWEEN convert(numeric,@p_Apu_Rubro_Codigo_Desde) AND convert(numeric,@p_Apu_Rubro_Codigo_Hasta)
	  AND dbo._Apu_Rubro_Nombre(Apu_Rubro_Id) like @p_Apu_Rubro_Nombre
	  AND dbo._Apu_Subtitulo_Nombre(dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) like @p_Apu_Subtitulo_Nombre
	  AND dbo._Apu_Titulo_Nombre(dbo._Apu_Subtitulo_Apu_Titulo_Id(dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id))) like @p_Apu_Titulo_Nombre)
	Apu_Rubro_Material,
	( SELECT Count(*) Count_Mano_Obra
	  FROM Apu_Rubro_Mano_Obra 
	  WHERE (@p_Apu_Insumo_Nombre = '%')
	  AND dbo._Apu_Rubro_Codigo(Apu_Rubro_Id) 
		  BETWEEN convert(numeric,@p_Apu_Rubro_Codigo_Desde) AND convert(numeric,@p_Apu_Rubro_Codigo_Hasta)
	  AND dbo._Apu_Rubro_Nombre(Apu_Rubro_Id) like @p_Apu_Rubro_Nombre
	  AND dbo._Apu_Subtitulo_Nombre(dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) like @p_Apu_Subtitulo_Nombre
	  AND dbo._Apu_Titulo_Nombre(dbo._Apu_Subtitulo_Apu_Titulo_Id(dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id))) like @p_Apu_Titulo_Nombre)
	Apu_Rubro_Mano_Obra,
	( SELECT Count(*) Count_Equipo
	  FROM Apu_Rubro_Equipo
	  WHERE (@p_Apu_Insumo_Nombre = '%' OR dbo._Apu_Equipo_Nombre (Apu_Equipo_Id) like @p_Apu_Insumo_Nombre)
	  AND dbo._Apu_Rubro_Codigo(Apu_Rubro_Id) 
		  BETWEEN convert(numeric,@p_Apu_Rubro_Codigo_Desde) AND convert(numeric,@p_Apu_Rubro_Codigo_Hasta)
	  AND dbo._Apu_Rubro_Nombre(Apu_Rubro_Id) like @p_Apu_Rubro_Nombre
	  AND dbo._Apu_Subtitulo_Nombre(dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) like @p_Apu_Subtitulo_Nombre
	  AND dbo._Apu_Titulo_Nombre(dbo._Apu_Subtitulo_Apu_Titulo_Id(dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id))) like @p_Apu_Titulo_Nombre)
	Apu_Rubro_Equipo
END

IF (@p_Tipo ='MAT' ) 
BEGIN
	  SELECT CASE WHEN  (Count(*) % @p_Numero_Registros) > 0 
				  THEN  (Count(*) / @p_Numero_Registros) + 1 
				  ELSE  (Count(*) / @p_Numero_Registros) END Total_Paginas
	  FROM Apu_Rubro_Material 
	  WHERE (@p_Apu_Insumo_Nombre = '%' OR dbo._Apu_Material_Nombre (Apu_Material_Id) like @p_Apu_Insumo_Nombre)
	  AND dbo._Apu_Rubro_Codigo(Apu_Rubro_Id) 
		  BETWEEN convert(numeric,@p_Apu_Rubro_Codigo_Desde) AND convert(numeric,@p_Apu_Rubro_Codigo_Hasta)
	  AND dbo._Apu_Rubro_Nombre(Apu_Rubro_Id) like @p_Apu_Rubro_Nombre
	  AND dbo._Apu_Subtitulo_Nombre(dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) like @p_Apu_Subtitulo_Nombre
	  AND dbo._Apu_Titulo_Nombre(dbo._Apu_Subtitulo_Apu_Titulo_Id(dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id))) like @p_Apu_Titulo_Nombre
END

IF (@p_Tipo ='MAN' ) 
BEGIN
	  SELECT CASE WHEN (Count(*) % @p_Numero_Registros) > 0 
				  THEN (Count(*) / @p_Numero_Registros) + 1 
				  ELSE (Count(*) / @p_Numero_Registros) END Total_Paginas
	  FROM Apu_Rubro_Mano_Obra
	  WHERE dbo._Apu_Rubro_Codigo(Apu_Rubro_Id) 
		  BETWEEN convert(numeric,@p_Apu_Rubro_Codigo_Desde) AND convert(numeric,@p_Apu_Rubro_Codigo_Hasta)
	  AND dbo._Apu_Rubro_Nombre(Apu_Rubro_Id) like @p_Apu_Rubro_Nombre
	  AND dbo._Apu_Subtitulo_Nombre(dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) like @p_Apu_Subtitulo_Nombre
	  AND dbo._Apu_Titulo_Nombre(dbo._Apu_Subtitulo_Apu_Titulo_Id(dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id))) like @p_Apu_Titulo_Nombre
END

IF (@p_Tipo ='EQU') 
BEGIN
	  SELECT CASE WHEN (Count(*) % @p_Numero_Registros) > 0 
				  THEN (Count(*) / @p_Numero_Registros) + 1 
				  ELSE (Count(*) / @p_Numero_Registros) END Total_Paginas
	  FROM Apu_Rubro_Equipo
	  WHERE (@p_Apu_Insumo_Nombre = '%' OR dbo._Apu_Equipo_Nombre (Apu_Equipo_Id) like @p_Apu_Insumo_Nombre)
	  AND dbo._Apu_Rubro_Codigo(Apu_Rubro_Id) 
		  BETWEEN convert(numeric,@p_Apu_Rubro_Codigo_Desde) AND convert(numeric,@p_Apu_Rubro_Codigo_Hasta)
	  AND dbo._Apu_Rubro_Nombre(Apu_Rubro_Id) like @p_Apu_Rubro_Nombre
	  AND dbo._Apu_Subtitulo_Nombre(dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) like @p_Apu_Subtitulo_Nombre
	  AND dbo._Apu_Titulo_Nombre(dbo._Apu_Subtitulo_Apu_Titulo_Id(dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id))) like @p_Apu_Titulo_Nombre
END
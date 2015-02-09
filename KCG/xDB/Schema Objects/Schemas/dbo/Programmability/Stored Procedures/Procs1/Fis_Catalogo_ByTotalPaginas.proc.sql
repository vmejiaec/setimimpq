CREATE PROCEDURE [dbo].[Fis_Catalogo_ByTotalPaginas]
(
	-- Parámetros obligatorios
	@p_Ver_Version_Id varchar(17),
	@p_Int_Empresa_Id varchar (17),

	-- Parátros Opcionales
	@p_Fecha_Creacion_Desde smalldatetime,
	@p_Fecha_Creacion_Hasta smalldatetime,
	@p_Fecha_Publicacion_Desde smalldatetime,
	@p_Fecha_Publicacion_Hasta smalldatetime,
	@p_Nombre varchar(17),

	-- Parámetros Paginación
	@p_Numero_Registros INT
)
AS
	SET NOCOUNT ON;
SELECT	
	CASE WHEN (Count(*) % @p_Numero_Registros)>0 THEN  (Count(*) / @p_Numero_Registros) + 1 ELSE	(Count(*) / @p_Numero_Registros)  END Total_Paginas
FROM Fis_Catalogo
WHERE 
		  Int_Empresa_Id = @p_Int_Empresa_Id
	AND   Fecha_Creacion between @p_Fecha_Creacion_Desde and @p_Fecha_Creacion_Hasta
	AND   Fecha_Publicacion between @p_Fecha_Publicacion_Desde and @p_Fecha_Publicacion_Hasta	
	AND	  (@p_Nombre='%' or Nombre like @p_Nombre)
CREATE PROCEDURE [dbo].[Fis_Catalogo_ByEmpresa]
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
	@p_Pagina_Actual INT,
	@p_Numero_Registros INT
)
AS
	SET NOCOUNT ON;
SELECT     
		Id, 
		Codigo, 
		Estado, 
		Descripcion, 
		Int_Empresa_Id, 
		Fecha_Creacion, 
		Creacion_Per_Personal_Id, 
		Fecha_Publicacion, 
		Nombre,

		dbo._Int_Empresa_Codigo (Int_Empresa_Id) Int_Empresa_Codigo,
		dbo._Int_Empresa_nombre (Int_Empresa_Id) Int_Empresa_Nombre,

		dbo._Per_Personal_Codigo(Creacion_Per_Personal_Id) Creacion_Per_Personal_Codigo,
		dbo._Per_Personal_Nombre(Creacion_Per_Personal_Id) Creacion_Per_Personal_Nombre,

		dbo.Estado ('FIS_CATALOGO','ESTADO',Estado, @p_Ver_Version_Id) Estado_Nombre

FROM 
(
	SELECT

			Id, 
			Codigo, 
			Estado, 
			Descripcion, 
			Int_Empresa_Id, 
			Fecha_Creacion, 
			Creacion_Per_Personal_Id, 
			Fecha_Publicacion, 
			Nombre,
			ROW_NUMBER() OVER (ORDER BY Fecha_Publicacion DESC ) AS RowNumber
	FROM Fis_Catalogo
	WHERE 
		  Int_Empresa_Id = @p_Int_Empresa_Id
	AND   Fecha_Creacion between @p_Fecha_Creacion_Desde and @p_Fecha_Creacion_Hasta
	AND   Fecha_Publicacion between @p_Fecha_Publicacion_Desde and @p_Fecha_Publicacion_Hasta	
	AND	  (@p_Nombre='%' or Nombre like @p_Nombre)


)   Fis_Catalogo
WHERE RowNumber > (@p_Numero_Registros * (@p_Pagina_Actual-1)) 
AND RowNumber <= (@p_Numero_Registros * (@p_Pagina_Actual))

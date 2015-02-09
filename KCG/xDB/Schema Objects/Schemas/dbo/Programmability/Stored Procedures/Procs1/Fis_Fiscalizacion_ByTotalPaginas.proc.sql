CREATE PROCEDURE [dbo].[Fis_Fiscalizacion_ByTotalPaginas]
(
    @p_Ver_Version_Id varchar (17),
   @p_Int_Sucursal_Id varchar(17),

	-- Parámetros Opcionales
	@p_Codigo_Desde varchar(200),
	@p_Codigo_Hasta varchar(200),
	@p_Codigo_Institucion varchar(200),
	@p_nombre_proyecto varchar(500),
    @p_estado varchar(3),
    @p_contratista varchar(200),
    @p_fiscalizador varchar(200),
	@p_Per_Personal_Id varchar(17),

	-- Parámetros Paginación
	@p_Numero_Registros INT

)
AS
	SET NOCOUNT ON;
     
		SELECT	
		CASE WHEN (Count(*) % @p_Numero_Registros)>0 THEN  (Count(*) / @p_Numero_Registros) + 1 ELSE	(Count(*) / @p_Numero_Registros)  END Total_Paginas
		FROM        Apu_Presupuesto
		WHERE Int_Sucursal_Id=@p_Int_Sucursal_Id
		AND Convert(numeric, Codigo) between Convert(numeric,@p_Codigo_Desde) and Convert(numeric,@p_Codigo_Hasta)
        AND (@p_nombre_proyecto='%' or Apu_Origen_Nombre like @p_nombre_proyecto)
		AND (@p_estado='%' or Estado  like @p_estado)
		AND (@p_Codigo_Institucion='%' or dbo._Apu_Presupuesto_Codigo_Institucional(Origen,Apu_Origen_Id) like @p_Codigo_Institucion)
		AND (@p_contratista='%' or dbo._Per_Personal_Nombre(Contratista_Per_Personal_Id) like  @p_contratista )
		AND (@p_fiscalizador='%' or dbo._Per_Personal_Nombre(Fiscalizador_Per_Personal_Id) like  @p_fiscalizador )










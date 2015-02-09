
CREATE PROCEDURE [dbo].[Apu_Proyecto_Insumo_ByTotalPaginas]
(
   @p_Ver_Version_Id varchar (17),
   @p_Int_sucursal_id varchar (17),
   @p_Numero_Registros int,
   @p_Codigo_Desde varchar(200),
   @p_Codigo_Hasta varchar(200),
   @p_Apu_Proyecto_Codigo varchar(200),
   @p_Apu_Proyecto_Nombre varchar(500),
   @p_Apu_Insumo_Nombre varchar(500),
   @p_Tipo varchar(3)

)
AS
	SET NOCOUNT ON;

if (@p_Codigo_Desde is null)
begin

	SELECT @p_Codigo_Desde=MIN(CONVERT(numeric, minimo))
	FROM (
		SELECT  MIN( Codigo) minimo
		FROM    Apu_Proyecto_Material
		UNION
		SELECT  MIN(Codigo) 
		FROM    Apu_Proyecto_Mano_Obra
		UNION
		SELECT MIN(Codigo) 
		FROM   Apu_Proyecto_Equipo
	) Apu_Proyecto_Mat_Man_Equ
end


if (@p_Codigo_Hasta is null)
begin

	SELECT @p_Codigo_Hasta=MAX(CONVERT(numeric, maximo))
	FROM (
		SELECT  MAX( Codigo) maximo
		FROM    Apu_Proyecto_Material
		UNION
		SELECT  MAX(Codigo) 
		FROM    Apu_Proyecto_Mano_Obra
		UNION
		SELECT MAX(Codigo) 
		FROM   Apu_Proyecto_Equipo
	) Apu_Proyecto_Mat_Man_Equ
end

if (@p_Apu_Proyecto_Codigo is null)
	set @p_Apu_Proyecto_Codigo='%';
if (@p_Apu_Proyecto_Nombre is null)
	set @p_Apu_Proyecto_Nombre='%'
if (@p_Apu_Insumo_Nombre is null)
	set @p_Apu_Insumo_Nombre='%'
if (@p_Tipo='%')
		set @p_Tipo=null


if (@p_Tipo IS NULL ) 
BEGIN
	SELECT  CASE WHEN ((Count_Material+Count_Material2+Count_Mano_Obra+Count_Equipo)%@p_Numero_Registros) >0 
				 THEN ((Count_Material+Count_Material2+Count_Mano_Obra+Count_Equipo)/@p_Numero_Registros) +1 
				 ELSE ((Count_Material+Count_Material2+Count_Mano_Obra+Count_Equipo)/@p_Numero_Registros) END Total_Paginas
            FROM
			(SELECT Count(*) Count_Material
			FROM   Apu_Proyecto_Material
			WHERE  dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_id ) = @p_Int_sucursal_id 
			AND ( convert(numeric,Codigo) between convert(numeric,@p_Codigo_Desde) and convert(numeric,@p_Codigo_Hasta))
			AND ( @p_Apu_Proyecto_Codigo ='%' OR dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) LIKE @p_Apu_Proyecto_Codigo)
			AND ( @p_Apu_Proyecto_Nombre ='%' OR dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id)LIKE @p_Apu_Proyecto_Nombre)
			AND ( @p_Apu_Insumo_Nombre ='%' OR dbo._Apu_Material_Nombre (Apu_Material_Id) LIKE @p_Apu_Insumo_Nombre)
            )Apu_Proyecto_Material,
			
			(SELECT Count(*) Count_Material2
			FROM   Apu_Proyecto_Material
			WHERE  dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_id ) = 1 
			AND ( convert(numeric,Codigo) between convert(numeric,109) and convert(numeric,416))
			AND ( null IS NULL OR dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) LIKE null)
			AND ( null IS NULL OR dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id)LIKE null)
			AND ( null IS NULL OR dbo._Apu_Material_Nombre (Apu_Material_Id) LIKE null)
            )Apu_Proyecto_Material2,
	
	        (
			SELECT Count(*) Count_Mano_Obra    
			FROM   Apu_Proyecto_Mano_Obra
			WHERE  dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_id ) = @p_Int_sucursal_id 
			AND ( convert(numeric,Codigo) between convert(numeric,@p_Codigo_Desde) and convert(numeric,@p_Codigo_Hasta))
			AND ( @p_Apu_Proyecto_Codigo= '%' OR dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) LIKE @p_Apu_Proyecto_Codigo)
			AND ( @p_Apu_Proyecto_Nombre='%' OR dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id)LIKE @p_Apu_Proyecto_Nombre)
			AND ( @p_Apu_Insumo_Nombre='%' OR dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) LIKE @p_Apu_Insumo_Nombre)
            )Apu_Proyecto_Mano_Obra,
			(
			SELECT Count(*) Count_Equipo         
			FROM  Apu_Proyecto_Equipo
			WHERE dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_id ) = @p_Int_sucursal_id 
			AND ( convert(numeric,Codigo) between convert(numeric,@p_Codigo_Desde) and convert(numeric,@p_Codigo_Hasta))
			AND ( @p_Apu_Proyecto_Codigo ='%' OR dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) LIKE @p_Apu_Proyecto_Codigo)
			AND ( @p_Apu_Proyecto_Nombre ='%' OR dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id)LIKE @p_Apu_Proyecto_Nombre)
			AND ( @p_Apu_Insumo_Nombre ='%' OR dbo._Apu_Equipo_Nombre (Apu_Equipo_Id) LIKE @p_Apu_Insumo_Nombre)
			)Apu_Proyecto_Equipo

END

IF (@p_Tipo ='MAT' OR @p_Tipo ='TRA' ) 
BEGIN
	        SELECT CASE WHEN (Count(*) % @p_Numero_Registros)>0 
						THEN (Count(*) / @p_Numero_Registros) + 1 
						ELSE (Count(*) / @p_Numero_Registros) END Total_Paginas
			FROM   Apu_Proyecto_Material
			WHERE  dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_id ) = @p_Int_sucursal_id 
			AND ( convert(numeric,Codigo) between convert(numeric,@p_Codigo_Desde) and convert(numeric,@p_Codigo_Hasta))
			AND ( @p_Apu_Proyecto_Codigo = '%' OR dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) LIKE @p_Apu_Proyecto_Codigo)
			AND ( @p_Apu_Proyecto_Nombre = '%' OR dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id)LIKE @p_Apu_Proyecto_Nombre)
			AND ( @p_Apu_Insumo_Nombre = '%' OR dbo._Apu_Material_Nombre (Apu_Material_Id) LIKE @p_Apu_Insumo_Nombre)
END

IF (@p_Tipo ='MAN' ) 
BEGIN
			SELECT CASE WHEN (Count(*) % @p_Numero_Registros)>0 
						THEN (Count(*) / @p_Numero_Registros) + 1 
						ELSE (Count(*) / @p_Numero_Registros) END Total_Paginas
			FROM   Apu_Proyecto_Mano_Obra
			WHERE  dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_id ) = @p_Int_sucursal_id 
			AND ( convert(numeric,Codigo) between convert(numeric,@p_Codigo_Desde) and convert(numeric,@p_Codigo_Hasta))
			AND ( @p_Apu_Proyecto_Codigo = '%' OR dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) LIKE @p_Apu_Proyecto_Codigo)
			AND ( @p_Apu_Proyecto_Nombre = '%' OR dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id)LIKE @p_Apu_Proyecto_Nombre)
			AND ( @p_Apu_Insumo_Nombre = '%' OR dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) LIKE @p_Apu_Insumo_Nombre)
END

IF (@p_Tipo ='EQU') 
BEGIN
			SELECT CASE WHEN (Count(*) % @p_Numero_Registros)>0 
						THEN (Count(*) / @p_Numero_Registros) + 1 
						ELSE (Count(*) / @p_Numero_Registros) END Total_Paginas
			FROM  Apu_Proyecto_Equipo
			WHERE dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_id ) = @p_Int_sucursal_id 
			AND ( convert(numeric,Codigo) between convert(numeric,@p_Codigo_Desde) and convert(numeric,@p_Codigo_Hasta))
			AND ( @p_Apu_Proyecto_Codigo = '%' OR dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) LIKE @p_Apu_Proyecto_Codigo)
			AND ( @p_Apu_Proyecto_Nombre = '%'OR dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id)LIKE @p_Apu_Proyecto_Nombre)
			AND ( @p_Apu_Insumo_Nombre = '%' OR dbo._Apu_Equipo_Nombre (Apu_Equipo_Id) LIKE @p_Apu_Insumo_Nombre)

END


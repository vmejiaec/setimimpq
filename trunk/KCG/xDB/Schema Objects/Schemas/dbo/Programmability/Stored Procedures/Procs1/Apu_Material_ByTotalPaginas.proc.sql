


CREATE PROCEDURE [dbo].[Apu_Material_ByTotalPaginas]
(
   @p_Ver_Version_id varchar(17),
  @p_Int_Sucursal_id varchar(17),
  @p_Numero_Registros int,
  @p_Codigo_Desde varchar(200),
  @p_Codigo_Hasta varchar(200),
  @p_Nombre varchar(500),
  @p_Unidad varchar(200),
  @p_Costo_Total_Desde numeric(17, 4),
  @p_Costo_Total_Hasta numeric(17, 4),
  @p_Disponible varchar(3)
   
)
AS
SET NOCOUNT ON;
if (@p_Codigo_Desde is null)
	set @p_Codigo_Desde='0';
if (@p_Codigo_Hasta is null)
	set @p_Codigo_Hasta='9999999999';


if ( @p_Nombre is null)
	set @p_Nombre='%';
if (@p_Unidad is null)
	set @p_Unidad='%'
if (@p_Disponible is null)
	set @p_Disponible ='%'

SELECT CASE WHEN (Count(*) % @p_Numero_Registros)>0 
			THEN (Count(*) / @p_Numero_Registros) + 1 
			ELSE (Count(*) / @p_Numero_Registros)  END Total_Paginas
FROM Apu_Material
where Int_Sucursal_Id= @p_Int_Sucursal_id 
AND ( convert(numeric,Codigo) between convert(numeric,@p_Codigo_Desde) and convert(numeric,@p_Codigo_Hasta))
AND (@p_Nombre ='%' OR Nombre like @p_Nombre)
and (@p_Unidad ='%' OR Unidad like @p_Unidad )
AND ( convert(numeric,dbo._Apu_Material_Costo_Total (id)) between convert(numeric,@p_Costo_Total_Desde) and convert(numeric,@p_Costo_Total_Hasta))
and (@p_Disponible='%' OR Disponible like @p_Disponible)

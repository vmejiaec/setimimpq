
CREATE PROCEDURE [dbo].[Apu_Oferta_ByTotalPaginas]
(
  @p_Ver_Version_Id varchar (17),
   @p_Int_Sucursal_id varchar(17) ,
   @p_Numero_Registros int,
   @p_Codigo_Desde varchar(200),
   @p_Codigo_Hasta varchar(200),
   @p_Estado varchar(3),
   @p_Nombre varchar(500),
   @p_Contratista varchar(500),
   @p_Tecnico_Per_Personal_Nombre varchar(500),
   @p_Apu_Lugar_Nombre varchar(500),
   @p_Apu_Provincia_Nombre varchar(500),
   @p_Apu_Presupuesto_Estado_Nombre varchar(500)	

   
)
AS
	SET NOCOUNT ON;
if (@p_Codigo_Desde is null)
begin
	select @p_Codigo_Desde=MIN(CONVERT (numeric, codigo))
	from Apu_Oferta
end

if (@p_Codigo_Hasta is null)
begin
	select @p_Codigo_Hasta=MAX(CONVERT (numeric, codigo))
	from Apu_Oferta
end


if (@p_Estado is null)
	set @p_Estado='%'
if (@p_Nombre is null)
	set @p_Nombre='%'
if (@p_Contratista is null)
	set @p_Contratista='%'
if (@p_Tecnico_Per_Personal_Nombre is null)
	set @p_Tecnico_Per_Personal_Nombre='%'
if (@p_Apu_Lugar_Nombre is null)
	set @p_Apu_Lugar_Nombre='%'
if (@p_Apu_Provincia_Nombre is null)
	set @p_Apu_Provincia_Nombre ='%'

SELECT CASE WHEN (Count(*) % @p_Numero_Registros)>0 
			THEN (Count(*) / @p_Numero_Registros) + 1 
			ELSE (Count(*) / @p_Numero_Registros) END Total_Paginas
FROM Apu_Oferta
	Where Int_sucursal_Id = @p_int_sucursal_id 
	AND ( convert(numeric,Codigo) between convert(numeric,@p_Codigo_Desde) and convert(numeric,@p_Codigo_Hasta))
	and (@p_Estado ='%' OR  Estado like @p_Estado)
	AND (@p_Nombre ='%'  OR Nombre like @p_Nombre)
--	and (Fecha_Creacion between @p_Fecha_Creacion_Desde and @p_Fecha_Creacion_Hasta)
	and (@p_Contratista ='%'  OR Contratista like @p_Contratista )
	and (@p_Tecnico_Per_Personal_Nombre ='%'  OR dbo._Per_Personal_Nombre(Tecnico_Per_Personal_Id) like @p_Tecnico_Per_Personal_Nombre)
	and (@p_Apu_Lugar_Nombre ='%'  OR dbo._Apu_Lugar_Nombre(Apu_Lugar_Id) like @p_Apu_Lugar_Nombre)
	and (@p_Apu_Provincia_Nombre ='%'  OR dbo._Apu_Provincia_Nombre(dbo._Apu_Lugar_Apu_Provincia_Id(Apu_Lugar_Id)) like @p_Apu_Provincia_Nombre)
	and (@p_Apu_Presupuesto_Estado_Nombre='%' OR dbo.Estado ('APU_PRESUPUESTO','ESTADO', dbo._Apu_Presupuesto_Estado(Id), @p_ver_version_Id) like @p_Apu_Presupuesto_Estado_Nombre)

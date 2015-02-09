
CREATE PROCEDURE [dbo].[Apu_Proyecto_Rubro_ByTotalPaginas]
(
   @p_Ver_Version_Id varchar (17),
   @p_Int_Sucursal_id varchar(17),
   @p_Numero_Registros int,
   @p_Apu_Proyecto_Codigo varchar(200),
   @p_Apu_Proyecto_Nombre varchar(500),

   @p_Apu_Rubro_Codigo varchar(200),
   @p_Apu_Rubro_Nombre varchar(500),

   @p_Apu_Subtitulo_Nombre varchar(500),
   @p_Apu_Titulo_Nombre varchar(500)
)
AS
	SET NOCOUNT ON;

if (@p_Apu_Proyecto_Codigo is null)
	set  @p_Apu_Proyecto_Codigo='%'
if (@p_Apu_Proyecto_Nombre is null)
	set @p_Apu_Proyecto_Nombre='%'
if (@p_Apu_Rubro_Codigo is null)
	set @p_Apu_Rubro_Codigo='%'
if (@p_Apu_Rubro_Nombre is null)
	set @p_Apu_Rubro_Nombre='%'
if (@p_Apu_Subtitulo_Nombre is null)
	set @p_Apu_Subtitulo_Nombre='%'
if (@p_Apu_Titulo_Nombre is null)
	set @p_Apu_Titulo_Nombre='%'

SELECT CASE WHEN (Count(*) % @p_Numero_Registros)>0 
			THEN (Count(*) / @p_Numero_Registros) + 1 
			ELSE (Count(*) / @p_Numero_Registros)  END Total_Paginas
FROM Apu_Proyecto_Rubro
where dbo._Apu_Proyecto_Int_Sucursal_Id (Apu_Proyecto_Id) = @p_Int_Sucursal_id
AND (@p_Apu_Proyecto_Codigo='%' OR dbo._Apu_Proyecto_Codigo(Apu_Proyecto_Id) like @p_Apu_Proyecto_Codigo)
AND	(@p_Apu_Proyecto_Nombre ='%' OR  dbo._Apu_Proyecto_Nombre(Apu_Proyecto_Id) like @p_Apu_Proyecto_Nombre)
AND	(@p_Apu_Rubro_Codigo='%' OR dbo._Apu_Rubro_Codigo(Apu_Rubro_Id) like @p_Apu_Rubro_Codigo )
AND (@p_Apu_Rubro_Nombre='%' OR dbo._Apu_Rubro_Nombre(Apu_Rubro_Id) like @p_Apu_Rubro_Nombre)
AND	(@p_Apu_Subtitulo_Nombre='%' OR dbo._Apu_SubTitulo_Nombre(Apu_Subtitulo_Id) like @p_Apu_Subtitulo_Nombre)
AND	(@p_Apu_Titulo_Nombre='%' OR dbo._Apu_Titulo_Nombre(dbo._Apu_Subtitulo_Apu_Titulo_Id(Apu_Subtitulo_Id)) like @p_Apu_Titulo_Nombre )
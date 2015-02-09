CREATE PROCEDURE [dbo].[Apu_Proyecto_Rubro_bySucursal]
(
   @p_Ver_Version_Id varchar (17),
   @p_Int_Sucursal_id varchar(17),
   @p_Numero_Registros int,
   @p_Pagina_Actual int,
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



SELECT   
    Id,
    Codigo,
    Apu_Proyecto_Id,
    Apu_Rubro_Id,
    Cantidad,
    Rendimiento_Mano_Obra,
    Rendimiento_Equipo,
	Apu_Subtitulo_id,
    Estado,
    
    Apu_Proyecto_Codigo,
    Apu_Proyecto_Nombre,
	Apu_Proyecto_Costo_Total,
 
    Apu_Subtitulo_Codigo,
    Apu_Subtitulo_Nombre,
   
    Apu_Rubro_Codigo,
    Apu_Rubro_Nombre,
    Apu_Rubro_Unidad,

    Apu_Titulo_id,
    Apu_Titulo_Codigo,
    Apu_Titulo_Nombre,

    Estado_Nombre_JPU,

    Rendimiento_Mano_Obra_Hora,
    Rendimiento_Equipo_Hora,
    
    Material_costo_total,
    Transporte_costo_total,
    Mano_obra_costo_total,
    Equipo_costo_total,

    Costo_Unitario,
    Costo_Total,
    Apu_Proyecto_Etapa,

    Apu_rubro_Costo_Total,

    Material_ultima_fecha_update,
    Transporte_ultima_fecha_update,
    Mano_obra_ultima_fecha_update,
    Equipo_ultima_fecha_update,

    Int_moneda_simbolo,
    
    Int_Sucursal_Id,

    0 --dbo._Apu_Proyecto_Rubro_Costo_Indirecto (Id)  
	Costo_Indirecto,

    0 --dbo._Apu_Proyecto_Rubro_Costo_Total_Indirecto (Id) 
	Costo_Directo_Indirecto

FROM  
(SELECT Id,
    Codigo,
    Apu_Proyecto_Id,
    Apu_Rubro_Id,
    Cantidad,
    Rendimiento_Mano_Obra,
    Rendimiento_Equipo,
	Apu_Subtitulo_id,
    Estado,
    
    dbo._Apu_Proyecto_Codigo(Apu_Proyecto_Id) AS Apu_Proyecto_Codigo, 
    dbo._Apu_Proyecto_Nombre(Apu_Proyecto_Id) AS Apu_Proyecto_Nombre, 
    dbo._Apu_Proyecto_Costo_Total(Apu_Proyecto_Id) AS Apu_Proyecto_Costo_Total, 
 
      dbo._Apu_Subtitulo_Codigo(Apu_Subtitulo_Id) AS Apu_Subtitulo_Codigo, 
    dbo._Apu_SubTitulo_Nombre(Apu_Subtitulo_Id) AS Apu_Subtitulo_Nombre, 
   
  dbo._Apu_Rubro_Codigo(Apu_Rubro_Id) AS Apu_Rubro_Codigo, 
    dbo._Apu_Rubro_Nombre(Apu_Rubro_Id) AS Apu_Rubro_Nombre, 
	dbo._Apu_Rubro_Unidad(Apu_Rubro_Id) AS Apu_Rubro_Unidad, 

 
    dbo._Apu_Subtitulo_Apu_Titulo_Id(Apu_Subtitulo_Id) AS Apu_Titulo_id, 
    dbo._Apu_Titulo_Codigo(dbo._Apu_Subtitulo_Apu_Titulo_Id(Apu_Subtitulo_Id)) AS Apu_Titulo_Codigo, 
	dbo._Apu_Titulo_Nombre(dbo._Apu_Subtitulo_Apu_Titulo_Id(Apu_Subtitulo_Id)) AS Apu_Titulo_Nombre, 

	dbo.Estado ('APU_PROYECTO_RUBRO', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre_JPU,

	dbo._Apu_Proyecto_Rubro_Rendimiento_Mano_Obra_Hora(Id) AS Rendimiento_Mano_Obra_Hora, 
	dbo._Apu_Proyecto_Rubro_Rendimiento_Equipo_Hora(Id) AS Rendimiento_Equipo_Hora,
    
 
	dbo._Apu_Proyecto_Rubro_Material_Costo_Total(Id) AS Material_costo_total, 
	dbo._Apu_Proyecto_Rubro_Transporte_Costo_Total(Id) AS Transporte_costo_total, 
	dbo._Apu_Proyecto_Rubro_Mano_Obra_Costo_Total(Id) AS Mano_obra_costo_total, 
	dbo._Apu_Proyecto_Rubro_Equipo_Costo_Total(Id) AS Equipo_costo_total, 


	dbo._Apu_Proyecto_Rubro_Costo_Unitario(Id) AS Costo_Unitario, 
	dbo._Apu_Proyecto_Rubro_Costo_Total_Con_Ind(Id) AS Costo_Total, 
	dbo._Apu_Proyecto_Etapa(Apu_Proyecto_Id) AS Apu_Proyecto_Etapa, 

	dbo._Apu_Rubro_Costo_Total(Apu_Rubro_Id, dbo._Apu_Proyecto_Int_Sucursal_Id(Apu_Proyecto_Id)) AS Apu_rubro_Costo_Total, 
	GETDATE() AS Material_ultima_fecha_update, 
	GETDATE() AS Transporte_ultima_fecha_update, 
	GETDATE() AS Mano_obra_ultima_fecha_update, 
	GETDATE() AS Equipo_ultima_fecha_update, 
	dbo._Apu_Proyecto_Rubro_Int_Moneda_Simbolo(Id) AS int_moneda_simbolo, 
	dbo._Apu_Proyecto_Int_Sucursal_Id(Apu_Proyecto_Id) AS Int_Sucursal_Id,
ROW_NUMBER() OVER (ORDER BY Codigo) AS RowNumber 
    
FROM  dbo.Apu_Proyecto_Rubro
where dbo._Apu_Proyecto_Int_Sucursal_Id (Apu_Proyecto_Id) = @p_Int_Sucursal_id
AND (@p_Apu_Proyecto_Codigo='%' OR dbo._Apu_Proyecto_Codigo(Apu_Proyecto_Id) like @p_Apu_Proyecto_Codigo)
AND	(@p_Apu_Proyecto_Nombre ='%' OR  dbo._Apu_Proyecto_Nombre(Apu_Proyecto_Id) like @p_Apu_Proyecto_Nombre)
AND	(@p_Apu_Rubro_Codigo='%' OR dbo._Apu_Rubro_Codigo(Apu_Rubro_Id) like @p_Apu_Rubro_Codigo )
AND (@p_Apu_Rubro_Nombre='%' OR dbo._Apu_Rubro_Nombre(Apu_Rubro_Id) like @p_Apu_Rubro_Nombre)
AND	(@p_Apu_Subtitulo_Nombre='%' OR dbo._Apu_SubTitulo_Nombre(Apu_Subtitulo_Id) like @p_Apu_Subtitulo_Nombre)
AND	(@p_Apu_Titulo_Nombre='%' OR dbo._Apu_Titulo_Nombre(dbo._Apu_Subtitulo_Apu_Titulo_Id(Apu_Subtitulo_Id)) like @p_Apu_Titulo_Nombre )
)
 v_Apu_Proyecto_Rubro
where   RowNumber > (@p_Numero_Registros* (@p_Pagina_Actual-1)) 
and RowNumber <= (@p_Numero_Registros * (@p_Pagina_Actual))














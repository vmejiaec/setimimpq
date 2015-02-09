CREATE PROCEDURE [dbo].[Apu_Presupuesto_Rubro_ByPresupuesto]
(
   @p_Ver_Version_Id varchar (17),
   @p_Apu_Presupuesto_Id varchar(17),
   @p_Estado varchar(3),

   @p_Apu_Rubro_Codigo varchar(200),
   @p_Apu_Rubro_Nombre varchar(500),
   @p_Apu_Rubro_Cantidad_Desde decimal(17,4),
   @p_Apu_Rubro_Cantidad_Hasta decimal(17,4),

   @p_Numero_Registros int,
   @p_Pagina_Actual int

)
AS
	SET NOCOUNT ON;
SELECT      Id, 
			Codigo, 
			Estado, 
			Descripcion, 
			Apu_Presupuesto_Id, 
			Apu_Rubro_id, 
			Apu_Rubro_Codigo, 
			Apu_Rubro_Nombre, 
			Apu_Rubro_Unidad, 
			Apu_Rubro_Cantidad, 
			Costo_Unitario, 
			Costo_Total, 
			Apu_Subtitulo_Id,

			dbo._Apu_Subtitulo_Codigo(Apu_Subtitulo_Id) AS Apu_Subtitulo_Codigo, 
			dbo._Apu_SubTitulo_Nombre(Apu_Subtitulo_Id) AS Apu_Subtitulo_Nombre, 
			dbo._Apu_Subtitulo_Apu_Titulo_Id(Apu_Subtitulo_Id) AS Apu_Titulo_id, 
			dbo._Apu_Titulo_Codigo(dbo._Apu_Subtitulo_Apu_Titulo_Id(Apu_Subtitulo_Id)) AS Apu_Titulo_Codigo, 
			dbo._Apu_Titulo_Nombre(dbo._Apu_Subtitulo_Apu_Titulo_Id(Apu_Subtitulo_Id)) AS Apu_Titulo_Nombre,
			dbo._Apu_Presupuesto_Apu_Origen_Id(Apu_Presupuesto_Id) Apu_Origen_Id


FROM      
(
	SELECT      Id, 
				Codigo, 
				Estado, 
				Descripcion, 
				Apu_Presupuesto_Id, 
				Apu_Rubro_id, 
				Apu_Rubro_Codigo, 
				Apu_Rubro_Nombre, 
				Apu_Rubro_Unidad, 
				Apu_Rubro_Cantidad, 
				Costo_Unitario, 
				Costo_Total, 
				Apu_Subtitulo_Id,
				ROW_NUMBER() OVER (ORDER BY convert(numeric,Codigo)) AS RowNumber 



	FROM        Apu_Presupuesto_Rubro
	WHERE Apu_Presupuesto_Id=@p_Apu_Presupuesto_Id
    and Apu_Rubro_Codigo like @p_Apu_Rubro_Codigo
	and Apu_Rubro_Nombre like @p_Apu_Rubro_Nombre
    and Apu_Rubro_Cantidad between @p_Apu_Rubro_Cantidad_Desde  and @p_Apu_Rubro_Cantidad_Hasta
	and (@p_Estado ='%' or Estado like @p_Estado)
	
)   Apu_Presupuesto_Rubro
where  RowNumber > (@p_Numero_Registros* (@p_Pagina_Actual-1)) 
and RowNumber <= (@p_Numero_Registros * (@p_Pagina_Actual))



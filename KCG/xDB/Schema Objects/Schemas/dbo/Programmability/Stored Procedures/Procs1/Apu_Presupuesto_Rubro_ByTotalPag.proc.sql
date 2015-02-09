CREATE PROCEDURE [dbo].[Apu_Presupuesto_Rubro_ByTotalPag]
(
   @p_Ver_Version_Id varchar (17),
   @p_Apu_Presupuesto_Id varchar(17),
   @p_Estado varchar(3),

   @p_Apu_Rubro_Codigo varchar(200),
   @p_Apu_Rubro_Nombre varchar(500),
   @p_Apu_Rubro_Cantidad_Desde decimal(17,4),
   @p_Apu_Rubro_Cantidad_Hasta decimal(17,4),

   @p_Numero_Registros int
)
AS
	SET NOCOUNT ON;

	SELECT CASE WHEN (Count(*) % @p_Numero_Registros)>0 
			THEN (Count(*) / @p_Numero_Registros) + 1 
			ELSE (Count(*) / @p_Numero_Registros) END Total_Paginas
	FROM        Apu_Presupuesto_Rubro
	WHERE Apu_Presupuesto_Id=@p_Apu_Presupuesto_Id
    and Apu_Rubro_Codigo like @p_Apu_Rubro_Codigo
	and Apu_Rubro_Nombre like @p_Apu_Rubro_Nombre
    and Apu_Rubro_Cantidad between @p_Apu_Rubro_Cantidad_Desde  and @p_Apu_Rubro_Cantidad_Hasta
	and (@p_Estado ='%' or Estado like @p_Estado)
	




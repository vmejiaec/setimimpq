CREATE PROCEDURE [dbo].[Apu_Presupuesto_Rubro_ByLikePresupuestoPlanilla]
(
   @p_Ver_Version_Id varchar (17),
   @p_Apu_Presupuesto_Id varchar(17),
   @p_Apu_Rubro_Nombre varchar(500),
   @p_Estado varchar(3),
   @p_Fis_Planilla_Id varchar(17)
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
			-- Se presneta la cantidad disponible actualmente del rubro
--			isnull(Apu_Rubro_Cantidad 
--			-
--			(
--				Select Sum(Cantidad)
--				From Fis_Planilla_Det
--				Where Apu_Presupuesto_Rubro.Id = Fis_Planilla_Det.Apu_Prespuesto_Rubro_Id),0.00)	
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
FROM        Apu_Presupuesto_Rubro
Where Apu_Presupuesto_Id = @p_Apu_Presupuesto_Id
And Apu_Rubro_Nombre like @p_Apu_Rubro_Nombre
and (@p_Estado='%' or Estado like @p_Estado)
And Id not in (Select Apu_Prespuesto_Rubro_Id
			   From Fis_Planilla_Det
			   Where Fis_Planilla_Id = @p_Fis_Planilla_Id)
--And 		isnull(Apu_Rubro_Cantidad 
--			-
--			(
--				Select Sum(Cantidad)
--				From Fis_Planilla_Det
--				Where Apu_Presupuesto_Rubro.Id = Fis_Planilla_Det.Apu_Prespuesto_Rubro_Id),0.00) > 0



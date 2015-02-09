CREATE PROCEDURE [dbo].[Apu_Proyecto_Pres_Rubro_ByOrigen]
(
   @p_Ver_Version_Id varchar (17),
   @p_Apu_Origen_Id varchar (17)
)
AS
	SET NOCOUNT ON;

Select	MAX(Id) Id,
		MAX(Codigo) Codigo , 
		Apu_Origen_Id,
		Apu_Rubro_Id,
		MAX(Apu_Rubro_Cantidad)Apu_Rubro_Cantidad ,
		MAX(Apu_Rubro_Codigo)Apu_Rubro_Codigo,
		MAX(Apu_Rubro_Nombre)Apu_Rubro_Nombre,
		MAX(Apu_Rubro_Unidad)Apu_Rubro_Unidad,
        dbo._Apu_Proyecto_Codigo(Apu_Origen_Id) AS Apu_Proyecto_Codigo, 
		dbo._apu_Proyecto_Nombre(Apu_Origen_Id) AS Apu_Proyecto_Nombre, 
		dbo._Apu_Proyecto_Rubro_Apu_Subtitulo_Id_1(Apu_Origen_Id,Apu_Rubro_Id ) AS Apu_Subtitulo_Id,

		dbo._Apu_Subtitulo_Codigo(dbo._Apu_Proyecto_Rubro_Apu_Subtitulo_Id_1(Apu_Origen_Id,Apu_Rubro_Id )) AS Apu_Subtitulo_Codigo, 
		dbo._Apu_SubTitulo_Nombre(dbo._Apu_Proyecto_Rubro_Apu_Subtitulo_Id_1(Apu_Origen_Id,Apu_Rubro_Id )) AS Apu_Subtitulo_Nombre, 

    dbo._Apu_Subtitulo_Apu_Titulo_Id(dbo._Apu_Proyecto_Rubro_Apu_Subtitulo_Id_1(Apu_Origen_Id,Apu_Rubro_Id )) AS Apu_Titulo_id, 
    dbo._Apu_Titulo_Codigo(dbo._Apu_Subtitulo_Apu_Titulo_Id(dbo._Apu_Proyecto_Rubro_Apu_Subtitulo_Id_1(Apu_Origen_Id,Apu_Rubro_Id ))) AS Apu_Titulo_Codigo, 
	dbo._Apu_Titulo_Nombre(dbo._Apu_Subtitulo_Apu_Titulo_Id(dbo._Apu_Proyecto_Rubro_Apu_Subtitulo_Id_1(Apu_Origen_Id,Apu_Rubro_Id ))) AS Apu_Titulo_Nombre ,
	dbo._Apu_Proyecto_Pres_Rubro_Costo_Unitario(Apu_Origen_Id,Apu_rubro_Id) Costo_Unitario,
	dbo.__Multiplicar_Dos_Decimales_2 (dbo._Apu_Proyecto_Pres_Rubro_Costo_Unitario(Apu_Origen_Id,Apu_rubro_Id),MAX(Apu_Rubro_Cantidad)) Costo_Total


from Apu_Presupuesto_rubro_insumo
where Apu_Origen_Id=@p_Apu_Origen_Id
group by Apu_Origen_Id,Apu_rubro_Id














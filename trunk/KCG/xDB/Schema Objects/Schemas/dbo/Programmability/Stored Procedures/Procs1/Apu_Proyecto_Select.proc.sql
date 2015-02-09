
CREATE PROCEDURE [dbo].[Apu_Proyecto_Select]
(
   @p_Ver_Version_Id varchar (17)
)
AS
	SET NOCOUNT ON;

SELECT  Id, 
		Codigo, 
		Codigo_Institucion, 
		Nombre, 
		Apu_Lugar_Id, 
		Area, 
		Porcentaje_Costo_Indirecto, 
		Porcentaje_Costo_Otros, 
		Fecha_Creacion, 
		Coordinador_Per_Personal_Id, 
		Tecnico_Per_Personal_Id, 
		Etapa, 
		Int_Sucursal_Id, 
		Int_Moneda_Id, 
		Fecha_Update, 
		Creacion_Per_Personal_Id, 
		Update_Per_Personal_Id, 
		Estado, 
		Costo_Directo, 
		Costo_Total, 
		Costo_Indirecto, 
		Costo_Otros, 
		Descripcion, 
		Tipo_Contrato,
	
	dbo._Apu_Lugar_Codigo(Apu_Lugar_Id) AS Apu_Lugar_Codigo, 
	dbo._Apu_Lugar_Nombre(Apu_Lugar_Id) AS Apu_Lugar_Nombre, 
	dbo._Apu_Lugar_Apu_Provincia_Id(Apu_Lugar_Id) AS Apu_provincia_id, 
    dbo._Apu_Provincia_Codigo(dbo._Apu_Lugar_Apu_Provincia_Id(Apu_Lugar_Id)) AS Apu_Provincia_Codigo, 
	dbo._Apu_Provincia_Nombre(dbo._Apu_Lugar_Apu_Provincia_Id(Apu_Lugar_Id)) AS Apu_Provincia_Nombre, 
	dbo._Int_Sucursal_Codigo(Int_Sucursal_Id) AS Int_Sucursal_Codigo, 
	dbo._Int_Sucursal_Nombre(Int_Sucursal_Id) AS Int_Sucursal_Nombre, 
	dbo._Int_Sucursal_Int_Empresa_Id(Int_Sucursal_Id) AS Int_Empresa_Id, 
	dbo._Int_Empresa_Codigo(dbo._Int_Sucursal_Int_Empresa_Id(Int_Sucursal_Id)) AS Int_Empresa_Codigo, 
	dbo._Int_Empresa_Nombre(dbo._Int_Sucursal_Int_Empresa_Id(Int_Sucursal_Id)) AS Int_Empresa_Nombre, 
	dbo._Per_Personal_Codigo(Creacion_Per_Personal_Id) AS Creacion_Per_Personal_Codigo, 
	dbo._Per_Personal_Nombre(Creacion_Per_Personal_Id) AS Creacion_Per_Personal_Nombre, 
	dbo._Per_Personal_Codigo(Update_Per_Personal_Id) AS Update_Per_Personal_Codigo, 
	dbo._Per_Personal_Nombre(Update_Per_Personal_Id) AS Update_Per_Personal_Nombre, 
	dbo._Per_Personal_Codigo(Coordinador_Per_Personal_Id) AS Coordinador_Per_Personal_Codigo, 
	dbo._Per_Personal_Nombre(Coordinador_Per_Personal_Id) AS Coordinador_Per_Personal_Nombre, 
	dbo._Per_Personal_Codigo(Tecnico_Per_Personal_Id) AS Tecnico_Per_Personal_Codigo, 
	dbo._Per_Personal_Nombre(Tecnico_Per_Personal_Id) AS Tecnico_Per_Personal_Nombre, 
	dbo._Int_Moneda_Codigo(Int_Moneda_Id) AS Int_Moneda_Codigo, 
	dbo._Int_Moneda_Nombre(Int_Moneda_Id) AS Int_Moneda_Nombre, 
	dbo._Int_Moneda_Simbolo(Int_Moneda_Id) AS Int_Moneda_Simbolo,
    
	dbo._Apu_Proyecto_Costo_Equipo (id) AS Costo_Equipo,
    dbo._Apu_Proyecto_Costo_Mano_Obra	(id) AS Costo_Mano_Obra,
    dbo._Apu_Proyecto_Costo_Material	(id) Costo_Material,
    dbo._Apu_Proyecto_Costo_Transporte	(id) Costo_Transporte,

    dbo._Apu_Proyecto_Costo_Metro_Cuadrado	(id) Costo_Metro_Cuadrado,

    dbo._Apu_Proyecto_Costo_Indirecto_Otros(Id)  Costo_Indirecto_Otros,

    dbo._Apu_Proyecto_Porcentaje_Costo_Indirecto_Otros(Id)  Porcentaje_Costo_Indirecto_Otros, 

    Costo_Directo Indice_Sumatoria,

    1.000 Coeficiente_Sumatoria,

    dbo._apu_proyecto_costo_mano_obra_cuadrilla (Id) Cuadrilla_Sumatoria,

   dbo._Apu_Proyecto_Cuadrilla_Coeficiente_Sumatoria1 (Id) Cuadrilla_Coeficiente_Sumatoria,

    dbo._Apu_Proyecto_Transporte_Suma_Porcentaje (Id) Suma_Porcentaje_Indice_Transporte,
 
    dbo.Dominio('APU_PROYECTO','ETAPA',Etapa,@p_ver_version_id) Etapa_Nombre,

    dbo.Estado ('APU_PROYECTO','ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre,

	space(2000) Cadena_Indice,
	space(2000) Cadena_Cuadrilla,

	dbo._Apu_Presupuesto_Estado(Id) Apu_Presupuesto_Estado,
    dbo.Estado ('APU_PRESUPUESTO','ESTADO', dbo._Apu_Presupuesto_Estado(Id), @p_ver_version_Id) Apu_Presupuesto_Estado_Nombre,
    dbo.Dominio('APU_PROYECTO','TIPO_CONTRATO',Tipo_Contrato,@p_ver_version_id) Tipo_Nombre

from Apu_Proyecto




  





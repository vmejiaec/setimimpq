CREATE PROCEDURE [dbo].[Apu_Oferta_ByIdResumido]
(
   @p_Ver_Version_Id varchar (17),
   @p_Apu_Oferta_Id varchar (17) 
)
AS
	SET NOCOUNT ON;


SELECT  Id, 
		Codigo, 
		Nombre, 
		Apu_Lugar_Id, 
		Area, 
		Porcentaje_Costo_Indirecto, 
		Porcentaje_Costo_Otros, 
		Fecha_Creacion, 
		Creacion_Per_Personal_Id, 
		Fecha_Update, 
		Update_Per_Personal_Id, 
		Contratista, 
		Tecnico_Per_Personal_Id, 
		Etapa, 
		Int_Sucursal_Id, 
		Int_Moneda_Id, 
		Estado, 
		Descripcion, 
		Codigo_Institucion, 
		Tipo_Contrato,
	
	dbo._Apu_Lugar_Codigo (apu_lugar_id) Apu_Lugar_Codigo,
	dbo._Apu_Lugar_Nombre (apu_lugar_id) Apu_Lugar_Nombre,

	dbo._Apu_Lugar_Apu_Provincia_Id (apu_lugar_id) Apu_provincia_id,
    dbo._Apu_Provincia_Codigo (dbo._Apu_Lugar_Apu_Provincia_Id (apu_lugar_id)) Apu_Provincia_Codigo,
    dbo._Apu_Provincia_Nombre (dbo._Apu_Lugar_Apu_Provincia_Id (apu_lugar_id)) Apu_Provincia_Nombre,
   
    '' Int_Sucursal_Codigo,
    '' Int_Sucursal_Nombre,

    '' Int_Empresa_Id,
    '' Int_Empresa_Codigo,
    '' Int_Empresa_Nombre,

    '' Creacion_Per_Personal_Codigo,
    '' Creacion_Per_Personal_Nombre,
    
    '' Update_Per_Personal_Codigo,
    '' Update_Per_Personal_Nombre,
     
    dbo._Per_Personal_Codigo (Tecnico_Per_Personal_Id) Tecnico_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Tecnico_Per_Personal_Id) Tecnico_Per_Personal_Nombre,
     
    '' Int_Moneda_Codigo,
    '' Int_Moneda_Nombre,
    '' Int_Moneda_Simbolo,
    
	dbo._Apu_Oferta_Costo_Equipo (id) Costo_Equipo,

	dbo._Apu_Oferta_Costo_Mano_Obra_Cuadrilla (Id) Costo_Mano_Obra,

    dbo._Apu_Oferta_Costo_Material (id) Costo_Material,
    dbo._Apu_Oferta_Costo_Transporte (id) Costo_Transporte,

    dbo._Apu_Oferta_Costo_Directo   (id) Costo_Directo,
    dbo._Apu_Oferta_Costo_Indirecto (id) Costo_Indirecto,
    dbo._Apu_Oferta_Costo_Otros     (id) Costo_Otros,
    dbo._Apu_Oferta_Costo_Total_1 (id) Costo_Total,  
 
    dbo._Apu_Oferta_Costo_Metro_Cuadrado (id) Costo_Metro_Cuadrado,
    dbo._Apu_Oferta_Costo_Indirecto_Otros (id) Costo_Indirecto_Otros,
    dbo._Apu_Oferta_Porcentaje_Costo_Indirecto_Otros (Id) Porcentaje_Costo_Indirecto_Otros, 
	
    0.00 Indice_Sumatoria,

    0.00 Coeficiente_Sumatoria,

	0.00 Cuadrilla_Sumatoria,

    0.00 Cuadrilla_Coeficiente_Sumatoria,

    0.00 Suma_Porcentaje_Indice_Transporte,
 
    ''  Etapa_Nombre,
    dbo.Estado ('APU_OFERTA','ESTADO', Estado, @p_ver_version_Id) Estado_Nombre,
	'' Cadena_Indice,
	'' Cadena_Cuadrilla,

	dbo._Apu_Presupuesto_Estado(Id) Apu_Presupuesto_Estado,
    dbo.Estado ('APU_PRESUPUESTO','ESTADO', dbo._Apu_Presupuesto_Estado(Id), @p_ver_version_Id) Apu_Presupuesto_Estado_Nombre,
    dbo.Dominio('APU_OFERTA','TIPO_CONTRATO' , Tipo_Contrato,  @p_ver_version_id) Tipo_Nombre


FROM         Apu_Oferta
where id = @p_Apu_Oferta_Id












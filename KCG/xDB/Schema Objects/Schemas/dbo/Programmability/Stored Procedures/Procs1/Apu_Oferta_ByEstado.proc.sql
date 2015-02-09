CREATE PROCEDURE [dbo].[Apu_Oferta_ByEstado]
(
   @p_Ver_Version_Id varchar (17),
   @p_nombre varchar (200),
   @p_Estado varchar (3) 
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
	
	'' Apu_Lugar_Codigo,
	'' Apu_Lugar_Nombre,

	'' Apu_provincia_id,
    '' Apu_Provincia_Codigo,
    '' Apu_Provincia_Nombre,
   
    '' Int_Sucursal_Codigo,
    ''Int_Sucursal_Nombre,

    '' Int_Empresa_Id,
    '' Int_Empresa_Codigo,
    '' Int_Empresa_Nombre,

    '' Creacion_Per_Personal_Codigo,
    '' Creacion_Per_Personal_Nombre,
    
    '' Update_Per_Personal_Codigo,
    '' Update_Per_Personal_Nombre,
     
    '' Tecnico_Per_Personal_Codigo,
    '' Tecnico_Per_Personal_Nombre,
     
    '' Int_Moneda_Codigo,
    '' Int_Moneda_Nombre,
    '' Int_Moneda_Simbolo,
    
	0.00 Costo_Equipo,
	0.00 Costo_Mano_Obra,
    0.00 Costo_Material,
    0.00 Costo_Transporte,

	0.00 Costo_Directo,
    0.00 Costo_Indirecto,
	0.00 Costo_Otros,
    0.00 Costo_Total,  
 
    0.00 Costo_Metro_Cuadrado,
    0.00 Costo_Indirecto_Otros,
    0.00 Porcentaje_Costo_Indirecto_Otros, 
	
    0.00 Indice_Sumatoria,
    0.00 Coeficiente_Sumatoria,
	0.00 Cuadrilla_Sumatoria,

    0.00 Cuadrilla_Coeficiente_Sumatoria,

    0.00 Suma_Porcentaje_Indice_Transporte,
 
    '' Etapa_Nombre,
    '' Estado_Nombre,
	'' Cadena_Indice,
	'' Cadena_Cuadrilla,

	'' Apu_Presupuesto_Estado,
    '' Apu_Presupuesto_Estado_Nombre,
    dbo.Dominio('APU_OFERTA','TIPO_CONTRATO' , Tipo_Contrato,  @p_ver_version_id) Tipo_Nombre


FROM         Apu_Oferta
where Estado like @p_Estado
and  Codigo like @p_nombre












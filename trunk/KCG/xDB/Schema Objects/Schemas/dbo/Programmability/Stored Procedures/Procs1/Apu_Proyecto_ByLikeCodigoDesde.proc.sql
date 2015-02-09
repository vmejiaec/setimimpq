CREATE PROCEDURE [dbo].[Apu_Proyecto_ByLikeCodigoDesde]
(
   @p_Ver_Version_Id varchar (17),
   @p_Int_sucursal_id varchar (17),
   @p_desde_Codigo varchar (200)
   
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
	
	
	' ' Apu_Lugar_Codigo,
	' ' Apu_Lugar_Nombre,

	' ' Apu_provincia_id,
    ' ' Apu_Provincia_Codigo,
    ' ' Apu_Provincia_Nombre,
   
    ' ' Int_Sucursal_Codigo,
    ' ' Int_Sucursal_Nombre,

    ' ' Int_Empresa_Id,
    ' ' Int_Empresa_Codigo,
    ' ' Int_Empresa_Nombre,

    ' ' Creacion_Per_Personal_Codigo,
    ' ' Creacion_Per_Personal_Nombre,
    
    ' ' Update_Per_Personal_Codigo,
    ' ' Update_Per_Personal_Nombre,
     
    ' ' Coordinador_Per_Personal_Codigo,
    ' ' Coordinador_Per_Personal_Nombre,
    
    ' ' Tecnico_Per_Personal_Codigo,
    ' ' Tecnico_Per_Personal_Nombre,
     
    ' 'Int_Moneda_Codigo,
    ' ' Int_Moneda_Nombre,
    ' ' Int_Moneda_Simbolo,
    
	0 Costo_Equipo,
    0 Costo_Mano_Obra,
    0 Costo_Material,
    0 Costo_Transporte,

    0 Costo_Metro_Cuadrado,
    0 Costo_Indirecto_Otros,
    0 Porcentaje_Costo_Indirecto_Otros, 
    0 Indice_Sumatoria,
    0 Coeficiente_Sumatoria,
    0 Cuadrilla_Sumatoria,
    0 Cuadrilla_Coeficiente_Sumatoria,

    0 Suma_Porcentaje_Indice_Transporte,
 
    ' ' Etapa_Nombre,
    ' ' Estado_Nombre,
    ' ' Cadena_Indice,
	' ' Cadena_Cuadrilla,

	dbo._Apu_Presupuesto_Estado(Id) Apu_Presupuesto_Estado,
    dbo.Estado ('APU_PRESUPUESTO','ESTADO', dbo._Apu_Presupuesto_Estado(Id), @p_ver_version_Id) Apu_Presupuesto_Estado_Nombre,
    dbo.Dominio('APU_PROYECTO','TIPO_CONTRATO',Tipo_Contrato,@p_ver_version_id) Tipo_Nombre

FROM   Apu_Proyecto
Where Int_Sucursal_Id = @p_Int_sucursal_id
 and  Convert(numeric,Codigo) >= @p_desde_Codigo
 




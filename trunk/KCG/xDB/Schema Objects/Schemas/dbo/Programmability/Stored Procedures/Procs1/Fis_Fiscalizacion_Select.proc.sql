CREATE PROCEDURE [dbo].[Fis_Fiscalizacion_Select]
(
   @p_Ver_Version_Id varchar (17)
)
AS
	SET NOCOUNT ON;

	DECLARE
		@v_Codigo_Institucional varchar(200),
		@v_Fecha_Contrato_Firma smalldatetime,
		@v_Contrato_Tipo varchar(200),
		@v_Fecha_APU_Aprobacion smalldatetime,
		@v_Fecha_Oferta_Cierre smalldatetime,
		@v_Fecha_Final smalldatetime,
		@v_Anticipo_Porcentaje numeric(17,4),
		@v_Tipo_Contrato_Legal varchar(200),
		@v_SubProyecto_Nombre varchar(200),
		@v_Proyecto_Nombre varchar(200),
		@v_Plazo int,
		@v_Coordinador1_Cedula varchar(200),
		@v_Coordinador2_Cedula varchar(200),
		@v_Programa varchar(200),
		@v_Coordinador1_Per_Personal_Nombre  varchar(200),
		@v_Coordinador2_Per_Personal_Nombre  varchar(200),
		@v_Ubicacion varchar(200),
		@v_Fecha_Indice_Base smalldatetime,
		@v_Fecha_Contrato_Adjudicacion smalldatetime,
		@v_Categoria varchar(200),
		@v_Origen char(3),
		@v_Apu_Origen_Id varchar(17),
		@v_Contratista_Cedula varchar(200),
		@v_Apu_Lugar_Nombre varchar(200),
		@v_Plazo_Ampliacion int

SELECT      Id, 
			Codigo, 
			Apu_Origen_Id, 
			Apu_Origen_Codigo, 
			Apu_Origen_Nombre, 
			Origen, 
			Costo_Directo, 
			Costo_Total, 
			Costo_Indirecto, 
			Costo_Otros, 
		    Equipo_Apu_Indice_Id, 
			ManoObra_Apu_Indice_Id, 
			Porcentaje_Costo_Indirecto, 
			Int_Sucursal_Id, 
			Apu_Mano_Obra_Id, 
			Estado, 

			Fiscalizador_Per_Personal_Id, -- Lo asigna ocn un combo en la página el Jede fe Fiscalización
			Contratista_Per_Personal_Id, --Se asigna la momento de insertar Apu_Presupuesto
			Fecha_Indices_Def, -- Es la fecha indice definitiva 
			Fecha_Creacion,			--Campo de Auditoria
			Creacion_Per_Personal_Id, --Campo de Auditoria
			Fecha_Update, -- Campo de Auditoria
			Update_Per_Personal_Id, --Campo de Auditoría
			Tipo,
				
			dbo._Apu_Presupuesto_Codigo_Institucional(Origen, Apu_Origen_Id)Codigo_Institucion,

			@v_Contrato_Tipo Tipo_Contrato,		
			@v_Fecha_Oferta_Cierre		Fecha_Cierre,
			@v_Fecha_APU_Aprobacion		Fecha_APU,
			@v_Fecha_Contrato_Firma		Fecha_Ini_Contrato,
			@v_Plazo					Plazo_Contrato,

			@v_Fecha_Final									Fecha_Fin_Contrato,
			((Costo_Total * @v_Anticipo_Porcentaje)/100)	Valor_Anticipo,
			@v_Anticipo_Porcentaje							Porcentaje_Anticipo,
			@v_Coordinador1_Per_Personal_Nombre				Coordinador_1,
			@v_Coordinador2_Per_Personal_Nombre				Coordinador_2,
			 @v_Apu_Lugar_Nombre							Lugar,
			

			space(200) Publicacion_Base,
			space(200) Publicacion_Base_Def,

			--Campos para el recuadro de Codigo Institucional
			@v_Contrato_Tipo		Contrato_Tipo,
			@v_Proyecto_Nombre		Proyecto_Costos,
			@v_SubProyecto_Nombre	SubProyecto_Costos,
			@v_Programa				Programa_Costos,
			@v_Tipo_Contrato_Legal	Tipo_Contrato_Costos,
			@v_Ubicacion			Ubicacion_Costos,
			@v_Fecha_Indice_Base    Fecha_Indice_Base,

			dbo._Per_Personal_Codigo(Creacion_Per_Personal_Id)Creacion_Per_Personal_Codigo,
			dbo._Per_Personal_Nombre(Creacion_Per_Personal_Id)Creacion_Per_Personal_Nombre,
			dbo._Per_Personal_Codigo(Update_Per_Personal_Id)Update_Per_Personal_Codigo,
			dbo._Per_Personal_Nombre(Update_Per_Personal_Id)Update_Per_Personal_Nombre,

			dbo._Per_Personal_Codigo(Fiscalizador_Per_Personal_Id)Fiscalizador_Per_Personal_Codigo,
			dbo._Per_Personal_Nombre(Fiscalizador_Per_Personal_Id)Fiscalizador_Per_Personal_Nombre,

			dbo._Per_Personal_Codigo(Contratista_Per_Personal_Id)Contratista_Per_Personal_Codigo,
			dbo._Per_Personal_Nombre(Contratista_Per_Personal_Id)Contratista_Per_Personal_Nombre,

			dbo.Per_Personal_Tipo_Fiscalizacion(Fiscalizador_Per_Personal_Id)Tipo_Fiscalizacion,

			dbo.Dominio('PER_PERSONAL','TIPO_FISCALIZADOR', dbo.Per_Personal_Tipo_Fiscalizacion(Fiscalizador_Per_Personal_Id), @p_Ver_Version_Id) Tipo_Fiscalizacion_Nombre, 

			dbo.Per_Personal_Jefe_Fiscalizacion(dbo._Int_Usuario_Per_Personal_Id( Fiscalizador_Per_Personal_Id)) Jefe_Fiscalizacion,
			dbo.Dominio('PER_PERSONAL','JEFE_FISCALIZACION', dbo.Per_Personal_Jefe_Fiscalizacion(Fiscalizador_Per_Personal_Id) , @p_Ver_Version_Id) Jefe_Fiscalizacion_Nombre,

			dbo.Dominio('APU_PRESUPUESTO','ORIGEN',Origen,@p_ver_version_id) Origen_Nombre,
			dbo.Estado ('APU_PRESUPUESTO','ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre,

			1.000 Coeficiente_Sumatoria,
			dbo._Apu_Presupuesto_Cuadrilla_Coeficiente(Id) Cuadrilla_Coeficiente_Sumatoria,
			dbo._Apu_Presupuesto_Cuadrilla_Costo_Total_Estado(Id,'DIS') SRD_x_Coeficiente_Sumatoria,

----		--Añadido JPU  06-11-2009
			dbo._Apu_Presupuesto_Rubro_Costo_Total(Id,'DIS') Costo_Total_Dis,
			dbo._Apu_Presupuesto_Rubro_Costo_Total(Id,'REA') Costo_Total_Rea,
			dbo._Apu_Presupuesto_Cuadrilla_Costo_Total_Estado(Id,'REA') SRD_x_Coeficiente_Sumatoria_Rea,

			isnull(@v_Plazo_Ampliacion,0) Plazo_Ampliacion,
			getdate()  Fecha_Final_Ampliacion,
			--Solo amplicacion del Plazo
			ISNULL(@v_Plazo_Ampliacion,0) Plazo_Ampliacion_Only

	FROM       Apu_Presupuesto




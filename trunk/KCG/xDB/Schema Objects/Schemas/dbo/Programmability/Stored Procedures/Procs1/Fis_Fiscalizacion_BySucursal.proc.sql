CREATE PROCEDURE dbo.Fis_Fiscalizacion_BySucursal
(
	-- Parámetros obligatorios
   @p_Ver_Version_Id varchar (17),
   @p_Int_Sucursal_Id varchar(17),
	-- Parámetros Opcionales
	@p_Codigo_Desde varchar(200),
	@p_Codigo_Hasta varchar(200),
	@p_Codigo_Institucion varchar(200),
	@p_nombre_proyecto varchar(500),
    @p_estado varchar(3),
    @p_contratista varchar(200),
    @p_fiscalizador varchar(200),
	@p_Per_Personal_Id varchar(17),
	-- Parámetros Paginación
	@p_Pagina_Actual INT,
	@p_Numero_Registros INT
)
AS
	SET NOCOUNT ON;

BEGIN

	-- Se obtiene el Código Institucional
	--set @v_Codigo_Institucional = dbo._Apu_Presupuesto_Codigo_Institucional(@v_Origen, @v_Apu_Origen_Id);
	DECLARE @v_Plazo_Ampliacion int,
	@Tipo_Fiscalizacion varchar(3)
	
	
	Set @Tipo_Fiscalizacion= (Select Tipo_Fiscalizacion From Per_Personal Where Id like @p_Per_Personal_Id)
	IF (@Tipo_Fiscalizacion='INT') 
	
	SELECT      
				Id, 
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
				Fecha_Indices_Def, -- Es la fecha indice definitiva. El usuario debe ingresarla en la página.
				Fecha_Creacion,			--Campo de Auditoria
				Creacion_Per_Personal_Id, --Campo de Auditoria
				Fecha_Update, -- Campo de Auditoria
				Update_Per_Personal_Id, --Campo de Auditoría
				Tipo, --Campo que puede tener OFE -- PRO. Se asigna al crearse el registro
					
				dbo._Apu_Presupuesto_Codigo_Institucional(Origen, Apu_Origen_Id) Codigo_Institucion,
				space(3) Tipo_Contrato,		

				getdate()					Fecha_Cierre,
				getdate()					Fecha_APU,


				---------------------------------------------------------------
				-- Fecha de Inicio del Contrato DESDE EL MODULO DE CONTRATOS
				---------------------------------------------------------------
				--sacpProy.CTO_FECHA 
				--getDate()Fecha_Ini_Contrato,

				isnull(sacpProy.CTO_FECHA ,getDate()) Fecha_Ini_Contrato,
				
				------------------------------------------------------------
				-- Se obtiene el plazo DESDE EL MODULO DE CONTRATOS
				------------------------------------------------------------
				isnull(sacpProy.CTO_PLAZO,0) Plazo_Contrato,


				----------------------------------------------------------------------------
				-- Se obtiene la fecha final del contrato DESDE EL MODULO DE CONTRATOS
				----------------------------------------------------------------------------
				 dateadd (Day, isnull(sacpProy.CTO_PLAZO,0), isnull(sacpProy.CTO_FECHA,getdate()) )Fecha_Fin_Contrato,

				--convert(numeric(17,4),CTO_ANTICIPO * CTO_MONTO / 100 )	
				0.00 Valor_Anticipo,
				

				--convert(numeric(17,2),CTO_ANTICIPO)	
				0.00 Porcentaje_Anticipo,

				-----------------------------------------------------------------------------
				-- Se obtiene el nombre del coordinador
				--dbo._Per_Personal_Nombre(dbo.Per_Personal_Id (sacpProy.Fun_Cedula)) 
				space(100)		Coordinador_1,
				space(50)		Coordinador_2,
				space(50)		Lugar,
				

				space(50)	Publicacion_Base,

				(Select Nombre 
				From Fis_Catalogo
				Where Fecha_Publicacion =
					(Select Max(Fecha_Publicacion) From Fis_Catalogo
					Where Fecha_Publicacion <= Fecha_Indices_Def))	Publicacion_Base_Def,


				--Campos para el recuadro de Codigo Institucional
				space(3)		Contrato_Tipo,
				space(50)		Proyecto_Costos,

				--sacpProy.SProy_Nombre	SubProyecto_Costos,
				(Select SPROY_NOMBRE
				 From v_Int_Subproyecto S
				 Where S.Codigo_Institucional = dbo._Apu_Presupuesto_Codigo_Institucional(Origen,Apu_Origen_Id))  
				SubProyecto_Costos,

				space(50)				Programa_Costos,
				space(50)	Tipo_Contrato_Costos,
				space(50)			Ubicacion_Costos,
				getdate()    Fecha_Indice_Base,


				dbo._Per_Personal_Codigo(Creacion_Per_Personal_Id)Creacion_Per_Personal_Codigo,
				dbo._Per_Personal_Nombre(Creacion_Per_Personal_Id)Creacion_Per_Personal_Nombre,
				dbo._Per_Personal_Codigo(Update_Per_Personal_Id)Update_Per_Personal_Codigo,
				dbo._Per_Personal_Nombre(Update_Per_Personal_Id)Update_Per_Personal_Nombre,

				dbo._Per_Personal_Codigo(Fiscalizador_Per_Personal_Id)Fiscalizador_Per_Personal_Codigo,
				dbo._Per_Personal_Nombre(Fiscalizador_Per_Personal_Id)Fiscalizador_Per_Personal_Nombre,

				dbo._Per_Personal_Codigo(Contratista_Per_Personal_Id)Contratista_Per_Personal_Codigo,
				dbo._Per_Personal_Nombre(Contratista_Per_Personal_Id)Contratista_Per_Personal_Nombre,

				dbo.Per_Personal_Tipo_Fiscalizacion(Fiscalizador_Per_Personal_Id)Tipo_Fiscalizacion,

				--dbo.Dominio('PER_PERSONAL','TIPO_FISCALIZADOR', dbo.Per_Personal_Tipo_Fiscalizacion(Fiscalizador_Per_Personal_Id), @p_Ver_Version_Id) Tipo_Fiscalizacion_Nombre, 
        
        'INT' Tipo_Fiscalizacion_Nombre, 
				'N' Jefe_Fiscalizacion,
				'N' Jefe_Fiscalizacion_Nombre,

				--dbo.Dominio('APU_PRESUPUESTO','ORIGEN',Origen,@p_ver_version_id) Origen_Nombre,
				--dbo.Estado ('APU_PRESUPUESTO','ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre,

        Origen Origen_Nombre,
				Estado Estado_Nombre,

				1.000 Coeficiente_Sumatoria,
				dbo._Apu_Presupuesto_Cuadrilla_Coeficiente(Id) Cuadrilla_Coeficiente_Sumatoria,
				dbo._Apu_Presupuesto_Cuadrilla_Costo_Total_Estado(Id,'DIS') SRD_x_Coeficiente_Sumatoria,

----			--Añadido JPU  06-11-2009
				dbo._Apu_Presupuesto_Rubro_Costo_Total(Id,'DIS') Costo_Total_Dis,
				dbo._Apu_Presupuesto_Rubro_Costo_Total(Id,'REA') Costo_Total_Rea,
				dbo._Apu_Presupuesto_Cuadrilla_Costo_Total_Estado(Id,'REA') SRD_x_Coeficiente_Sumatoria_Rea,

				isnull(@v_Plazo_Ampliacion,0) Plazo_Ampliacion,
				getdate()  Fecha_Final_Ampliacion,

				--Solo amplicacion del Plazo
				ISNULL(@v_Plazo_Ampliacion,0) Plazo_Ampliacion_Only
	FROM       
			(	SELECT      
				Id, 
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
				ROW_NUMBER() OVER (ORDER BY Cast(Codigo as numeric) Desc) AS RowNumber
				

		FROM       Apu_Presupuesto
			WHERE Int_Sucursal_Id=@p_Int_Sucursal_Id
			--AND Convert(numeric, Codigo) between Convert(numeric,@p_Codigo_Desde) and Convert(numeric,@p_Codigo_Hasta)
			--AND (@p_nombre_proyecto='%' or Apu_Origen_Nombre like @p_nombre_proyecto)
			--AND (@p_estado='%' or Estado like @p_estado)
			--AND (@p_Codigo_Institucion='%' or dbo._Apu_Presupuesto_Codigo_Institucional(Origen,Apu_Origen_Id) like @p_Codigo_Institucion)
			--AND (@p_contratista='%' or dbo._Per_Personal_Nombre(Contratista_Per_Personal_Id) like  @p_contratista )
			--AND (@p_fiscalizador='%' or dbo._Per_Personal_Nombre(Fiscalizador_Per_Personal_Id) like  @p_fiscalizador )


	)Apu_Presupuesto , v_Contrato_ResumIDO sacpProy
	WHERE RowNumber > (@p_Numero_Registros * (@p_Pagina_Actual-1)) 
	AND RowNumber <= (@p_Numero_Registros * (@p_Pagina_Actual))
  AND dbo._Apu_Presupuesto_Codigo_Institucional(Origen, Apu_Origen_Id) = sacpProy.Codigo_Institucional

	ELSE
	
	SELECT      
				Id, 
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
				Fecha_Indices_Def, -- Es la fecha indice definitiva. El usuario debe ingresarla en la página.
				Fecha_Creacion,			--Campo de Auditoria
				Creacion_Per_Personal_Id, --Campo de Auditoria
				Fecha_Update, -- Campo de Auditoria
				Update_Per_Personal_Id, --Campo de Auditoría
				Tipo, --Campo que puede tener OFE -- PRO. Se asigna al crearse el registro
					
				dbo._Apu_Presupuesto_Codigo_Institucional(Origen, Apu_Origen_Id) Codigo_Institucion,
				space(3) Tipo_Contrato,		

				getdate()					Fecha_Cierre,
				getdate()					Fecha_APU,


				---------------------------------------------------------------
				-- Fecha de Inicio del Contrato DESDE EL MODULO DE CONTRATOS
				---------------------------------------------------------------
				--sacpProy.CTO_FECHA 
				--getDate()Fecha_Ini_Contrato,

				isnull(sacpProy.CTO_FECHA ,getDate()) Fecha_Ini_Contrato,
				
				------------------------------------------------------------
				-- Se obtiene el plazo DESDE EL MODULO DE CONTRATOS
				------------------------------------------------------------
				isnull(sacpProy.CTO_PLAZO,0) Plazo_Contrato,


				----------------------------------------------------------------------------
				-- Se obtiene la fecha final del contrato DESDE EL MODULO DE CONTRATOS
				----------------------------------------------------------------------------
				 dateadd (Day, isnull(sacpProy.CTO_PLAZO,0), isnull(sacpProy.CTO_FECHA,getdate()) )Fecha_Fin_Contrato,

				--convert(numeric(17,4),CTO_ANTICIPO * CTO_MONTO / 100 )	
				0.00 Valor_Anticipo,
				

				--convert(numeric(17,2),CTO_ANTICIPO)	
				0.00 Porcentaje_Anticipo,

				-----------------------------------------------------------------------------
				-- Se obtiene el nombre del coordinador
				--dbo._Per_Personal_Nombre(dbo.Per_Personal_Id (sacpProy.Fun_Cedula)) 
				space(100)		Coordinador_1,
				space(50)		Coordinador_2,
				space(50)		Lugar,
				

				space(50)	Publicacion_Base,

				(Select Nombre 
				From Fis_Catalogo
				Where Fecha_Publicacion =
					(Select Max(Fecha_Publicacion) From Fis_Catalogo
					Where Fecha_Publicacion <= Fecha_Indices_Def))	Publicacion_Base_Def,


				--Campos para el recuadro de Codigo Institucional
				space(3)		Contrato_Tipo,
				space(50)		Proyecto_Costos,

				--sacpProy.SProy_Nombre	SubProyecto_Costos,
				(Select SPROY_NOMBRE
				 From v_Int_Subproyecto S
				 Where S.Codigo_Institucional = dbo._Apu_Presupuesto_Codigo_Institucional(Origen,Apu_Origen_Id))  
				SubProyecto_Costos,

				space(50)				Programa_Costos,
				space(50)	Tipo_Contrato_Costos,
				space(50)			Ubicacion_Costos,
				getdate()    Fecha_Indice_Base,


				dbo._Per_Personal_Codigo(Creacion_Per_Personal_Id)Creacion_Per_Personal_Codigo,
				dbo._Per_Personal_Nombre(Creacion_Per_Personal_Id)Creacion_Per_Personal_Nombre,
				dbo._Per_Personal_Codigo(Update_Per_Personal_Id)Update_Per_Personal_Codigo,
				dbo._Per_Personal_Nombre(Update_Per_Personal_Id)Update_Per_Personal_Nombre,

				dbo._Per_Personal_Codigo(Fiscalizador_Per_Personal_Id)Fiscalizador_Per_Personal_Codigo,
				dbo._Per_Personal_Nombre(Fiscalizador_Per_Personal_Id)Fiscalizador_Per_Personal_Nombre,

				dbo._Per_Personal_Codigo(Contratista_Per_Personal_Id)Contratista_Per_Personal_Codigo,
				dbo._Per_Personal_Nombre(Contratista_Per_Personal_Id)Contratista_Per_Personal_Nombre,

				dbo.Per_Personal_Tipo_Fiscalizacion(Fiscalizador_Per_Personal_Id)Tipo_Fiscalizacion,

				--dbo.Dominio('PER_PERSONAL','TIPO_FISCALIZADOR', dbo.Per_Personal_Tipo_Fiscalizacion(Fiscalizador_Per_Personal_Id), @p_Ver_Version_Id) Tipo_Fiscalizacion_Nombre, 

        'INT' Tipo_Fiscalizacion_Nombre, 

				'N' Jefe_Fiscalizacion,
				'N' Jefe_Fiscalizacion_Nombre,

				--dbo.Dominio('APU_PRESUPUESTO','ORIGEN',Origen,@p_ver_version_id) Origen_Nombre,
				--dbo.Estado ('APU_PRESUPUESTO','ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre,

        Origen Origen_Nombre,
				Estado Estado_Nombre,

				1.000 Coeficiente_Sumatoria,
				dbo._Apu_Presupuesto_Cuadrilla_Coeficiente(Id) Cuadrilla_Coeficiente_Sumatoria,
				dbo._Apu_Presupuesto_Cuadrilla_Costo_Total_Estado(Id,'DIS') SRD_x_Coeficiente_Sumatoria,

----			--Añadido JPU  06-11-2009
				dbo._Apu_Presupuesto_Rubro_Costo_Total(Id,'DIS') Costo_Total_Dis,
				dbo._Apu_Presupuesto_Rubro_Costo_Total(Id,'REA') Costo_Total_Rea,
				dbo._Apu_Presupuesto_Cuadrilla_Costo_Total_Estado(Id,'REA') SRD_x_Coeficiente_Sumatoria_Rea,

				isnull(@v_Plazo_Ampliacion,0) Plazo_Ampliacion,
				getdate()  Fecha_Final_Ampliacion,

				--Solo amplicacion del Plazo
				ISNULL(@v_Plazo_Ampliacion,0) Plazo_Ampliacion_Only
	FROM       
			(	SELECT      
				Id, 
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
				ROW_NUMBER() OVER (ORDER BY Cast(Codigo as numeric) Desc) AS RowNumber
				

		FROM       Apu_Presupuesto
			WHERE Int_Sucursal_Id=@p_Int_Sucursal_Id
			--AND Convert(numeric, Codigo) between Convert(numeric,@p_Codigo_Desde) and Convert(numeric,@p_Codigo_Hasta)
			--AND (@p_nombre_proyecto='%' or Apu_Origen_Nombre like @p_nombre_proyecto)
			--AND (@p_estado='%' or Estado like @p_estado)
			--AND (@p_Codigo_Institucion='%' or dbo._Apu_Presupuesto_Codigo_Institucional(Origen,Apu_Origen_Id) like @p_Codigo_Institucion)
			--AND (@p_contratista='%' or dbo._Per_Personal_Nombre(Contratista_Per_Personal_Id) like  @p_contratista )
			--AND (@p_fiscalizador='%' or dbo._Per_Personal_Nombre(Fiscalizador_Per_Personal_Id) like  @p_fiscalizador )
			--AND Fiscalizador_Per_Personal_Id like @p_Per_Personal_Id


	)Apu_Presupuesto , v_Contrato_ResumIDO sacpProy
	WHERE RowNumber > (@p_Numero_Registros * (@p_Pagina_Actual-1)) 
	AND RowNumber <= (@p_Numero_Registros * (@p_Pagina_Actual))
  AND dbo._Apu_Presupuesto_Codigo_Institucional(Origen, Apu_Origen_Id) = sacpProy.Codigo_Institucional
	AND Fiscalizador_Per_Personal_Id like @p_Per_Personal_Id

END








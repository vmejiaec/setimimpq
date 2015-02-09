CREATE PROCEDURE [dbo].[Apu_Presupuesto_ById]
(
   @p_Ver_Version_Id varchar (17),
   @p_Id varchar(17),
   @p_Estado varchar(3)
)
AS
	SET NOCOUNT ON;

BEGIN
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
			Apu_Mano_Obra_Id, Estado, 
		    Fiscalizador_Per_Personal_Id, 
			Contratista_Per_Personal_Id, 
			Fecha_Indices_Def, 
			Fecha_Creacion, 
			Creacion_Per_Personal_Id, 
			Fecha_Update, 
		    Update_Per_Personal_Id, 
			Tipo,

   		    Costo_Directo Indice_Sumatoria,

			1.000 Coeficiente_Sumatoria,

			dbo._Apu_Presupuesto_Cuadrilla_Costo_Total(Id, 'DIS') Cuadrilla_Sumatoria,
			dbo._Apu_Presupuesto_Cuadrilla_Coeficiente(Id) Cuadrilla_Coeficiente_Sumatoria,

			0.00 Suma_Porcentaje_Indice_Transporte,
		 
			dbo.Dominio('APU_PRESUPUESTO','ORIGEN',Origen,@p_ver_version_id) Origen_Nombre,
			dbo.Estado ('APU_PRESUPUESTO','ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre,

			dbo._Apu_Proyecto_Pres_Cadena_Indice (id,Apu_Origen_Id,@p_Estado ) Cadena_Indice,
			dbo._Apu_Proyecto_Pres_Cadena_Cuadrilla (id,@p_Estado) Cadena_Cuadrilla,



			dbo.Dominio('APU_PRESUPUESTO','ORIGEN',Origen,@p_ver_version_id) Tipo_Nombre,
			dbo._Apu_Presupuesto_Codigo_Institucional(Origen, Apu_Origen_Id)Codigo_Institucional

FROM        Apu_Presupuesto
WHERE Id =@p_Id


END
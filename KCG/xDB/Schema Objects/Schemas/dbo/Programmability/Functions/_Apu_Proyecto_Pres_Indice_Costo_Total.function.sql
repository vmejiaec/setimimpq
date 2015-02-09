-- Esta funcion devuelve la sumatoria de la CANTIDAD de material 
-- utilziada en todo el proyecto.
CREATE FUNCTION [dbo].[_Apu_Proyecto_Pres_Indice_Costo_Total]
(
	@p_apu_origen_id varchar(17)
)
RETURNS numeric(17,2)
BEGIN
    
    declare 
      @v_material numeric(17,4),
      @v_transporte numeric(17,4),
      @v_mano_obra numeric(17,4),
      @v_equipo numeric(17,4),
      @v_total numeric (17,4),
      @v_int_sucursal_Id varchar(17),
      @v_ManoObra_Apu_Indice_Id varchar(17),
      @v_Equipo_Apu_Indice_Id varchar(17),
	  @v_costo_indice numeric (17,4)

    SET @v_material = 
			( Select isnull( sum(isnull( dbo.__multiplicar_cuatro_decimales_2( dbo.__multiplicar_cuatro_decimales_2(Costo_Diario,Cantidad), Apu_Rubro_Cantidad) ,0)),0)
			from Apu_Presupuesto_Rubro_Insumo
			where Apu_Origen_Id  = @p_apu_origen_id
				  AND  Insumo='MAT' 
				  AND  apu_insumo_id in
						(select apu_material_id
						 from apu_proyecto_material
						 where apu_proyecto_id =  @p_apu_origen_id
						 ))

	SET @v_transporte=
			( Select isnull( sum(isnull( dbo.__multiplicar_cuatro_decimales_2( dbo.__multiplicar_cuatro_decimales_2(Costo_Diario,Cantidad), Apu_Rubro_Cantidad) ,0)),0)
			from Apu_Presupuesto_Rubro_Insumo
			where Apu_Origen_Id  = @p_apu_origen_id
				  AND  Insumo='TRA' 
				  AND  apu_insumo_id in
						(select apu_material_id
						 from apu_proyecto_material
						 where apu_proyecto_id =  @p_apu_origen_id
						 ))




   SET @v_mano_obra=
			( Select isnull( sum(isnull( dbo.__multiplicar_cuatro_decimales_2( dbo.__multiplicar_cuatro_decimales_2(Costo_Diario,Rendimiento), Apu_Rubro_Cantidad),0)),0)
			from Apu_Presupuesto_Rubro_Insumo
			where Apu_Origen_Id  = @p_apu_origen_id
				  AND  Insumo='MAN' 
				  AND  apu_insumo_id in
						(select apu_mano_obra_id
						 from apu_proyecto_mano_obra
						 where apu_proyecto_id =  @p_apu_origen_id
						 ))


   SET @v_equipo=
			( Select isnull( sum(isnull(dbo.__Porcentaje_Cuatro_Decimales (  dbo.__multiplicar_cuatro_decimales_2( dbo.__multiplicar_cuatro_decimales_2(Costo_Diario,Rendimiento),Apu_Rubro_Cantidad), dbo._Apu_Presupuesto_Insumo_Porcentaje(Apu_Indice_Id, apu_insumo_id) ) ,0)),0)
			from Apu_Presupuesto_Rubro_Insumo, apu_proyecto_equipo,apu_proyecto_equipo_indice
			where Apu_Origen_Id  = @p_apu_origen_id
		    AND  Insumo='EQU' 
			AND  apu_insumo_id= apu_equipo_id
			and apu_proyecto_id=apu_origen_id
			and apu_proyecto_equipo.Id=apu_proyecto_equipo_indice.Apu_proyecto_equipo_id
            and apu_proyecto_equipo.Id in (select apu_proyecto_equipo_id  from apu_proyecto_equipo_indice )
			and apu_proyecto_id =  @p_apu_origen_id
			 )



  exec @v_total = dbo.__suma_dos_decimales_4 
                    @v_material, 
                    @v_transporte,
                    @v_mano_obra,
                    @v_equipo

  return  @v_total

END



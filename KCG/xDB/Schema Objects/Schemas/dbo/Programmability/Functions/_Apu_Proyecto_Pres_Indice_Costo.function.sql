-- Esta funcion devuelve la sumatoria de la CANTIDAD de material 
-- utilziada en todo el proyecto.
CREATE FUNCTION [dbo].[_Apu_Proyecto_Pres_Indice_Costo]
(
	@p_apu_origen_id varchar(17),
    @p_apu_indice_id varchar(17)
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
						 and apu_indice_id = @p_apu_indice_id))

	SET @v_transporte=
			( Select isnull( sum(isnull( dbo.__multiplicar_cuatro_decimales_2( dbo.__multiplicar_cuatro_decimales_2(Costo_Diario,Cantidad), Apu_Rubro_Cantidad) ,0)),0)
			from Apu_Presupuesto_Rubro_Insumo
			where Apu_Origen_Id  = @p_apu_origen_id
				  AND  Insumo='TRA' 
				  AND  apu_insumo_id in
						(select apu_material_id
						 from apu_proyecto_material
						 where apu_proyecto_id =  @p_apu_origen_id
						 and apu_indice_id = @p_apu_indice_id))




   SET @v_mano_obra=
			( Select isnull( sum(isnull( dbo.__multiplicar_cuatro_decimales_2( dbo.__multiplicar_cuatro_decimales_2(Costo_Diario,Rendimiento), Apu_Rubro_Cantidad),0)),0)
			from Apu_Presupuesto_Rubro_Insumo
			where Apu_Origen_Id  = @p_apu_origen_id
				  AND  Insumo='MAN' 
				  AND  apu_insumo_id in
						(select apu_mano_obra_id
						 from apu_proyecto_mano_obra
						 where apu_proyecto_id =  @p_apu_origen_id
						 and apu_indice_id = @p_apu_indice_id 
						 ))

 -- se obtiene la sucursal del proyecto
   exec @v_int_sucursal_id = dbo._Apu_Proyecto_Int_Sucursal_Id @p_apu_origen_id
   
   -- Se obtiene el indice de mano de obra
   exec @v_ManoObra_Apu_Indice_Id = dbo._Apu_Parametros_ManoObra_Apu_Indice_Id @v_int_sucursal_id
--
   -- Se verifica si el indice que se recibio como parametro es el indice de
   -- mano de obra 
   if (@p_apu_indice_id = @v_ManoObra_Apu_Indice_Id)
   begin

   -- Se obtiene el indice del mecanico de mantenimiento
    exec @v_Equipo_Apu_Indice_id = dbo._Apu_Parametros_Equipo_Apu_Indice_Id @v_int_sucursal_id
       
      -- Se obtiene el costo del indice del mecanico de mantenimiento
      set @v_costo_indice =( Select sum(Costo_Indice)
							from Apu_Presupuesto_Indice
							where Apu_Indice_Id=@v_Equipo_Apu_Indice_id)
	set @v_mano_obra = dbo.__Suma_Cuatro_Decimales_2(@v_mano_obra,@v_costo_indice)

   end

   SET @v_equipo=
			( Select isnull( sum(isnull(dbo.__Porcentaje_Cuatro_Decimales (  dbo.__multiplicar_cuatro_decimales_2( dbo.__multiplicar_cuatro_decimales_2(Costo_Diario,Rendimiento),Apu_Rubro_Cantidad), dbo._Apu_Presupuesto_Insumo_Porcentaje(@p_apu_indice_id, apu_insumo_id) ) ,0)),0)
			from Apu_Presupuesto_Rubro_Insumo
			where Apu_Origen_Id  = @p_apu_origen_id
				  AND  Insumo='EQU' 
				  AND  apu_insumo_id in
						(select apu_equipo_id
						from apu_proyecto_equipo
						where id in 
						(select apu_proyecto_equipo_id
						 from apu_proyecto_equipo_indice
						 where  apu_indice_id = @p_apu_indice_id )
						 and apu_proyecto_id =  @p_apu_origen_id)
			 )



  exec @v_total = dbo.__suma_dos_decimales_4 
                    @v_material, 
                    @v_transporte,
                    @v_mano_obra,
                    @v_equipo

  return  @v_total

END



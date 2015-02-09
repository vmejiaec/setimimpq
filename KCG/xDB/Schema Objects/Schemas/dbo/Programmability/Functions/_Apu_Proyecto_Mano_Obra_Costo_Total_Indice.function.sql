

-- Suma el total del costo de la mano de obra de un proyecto y un indice 
-- especifico que recibe como parámetro.
CREATE FUNCTION [dbo].[_Apu_Proyecto_Mano_Obra_Costo_Total_Indice]
(
	@p_apu_proyecto_id varchar(17),
    @p_apu_indice_id varchar(17)
)
RETURNS numeric(17,2)
BEGIN
    
    declare 
       @v_total numeric(17,4),
       @v_costo_equipo numeric (17,4),
	   @v_costo_material numeric(17,4),
	   @v_costo_transporte numeric(17,4),
       @v_Equipo_Apu_Indice_Id varchar(17),
       @v_ManoObra_Apu_Indice_Id varchar(17),
       @v_int_sucursal_Id varchar(17)
           
   set @v_total = 0

	select  @v_total = 
	(
		select
			sum(
				dbo.__multiplicar_cuatro_decimales_2
				(
					dbo._apu_proyecto_rubro_mano_obra_costo_x_rendimiento (id, @p_apu_proyecto_id),
					dbo._apu_proyecto_rubro_cantidad (apu_proyecto_rubro_id)
				)
			)
		from apu_proyecto_rubro_mano_obra
		where dbo._apu_proyecto_rubro_apu_proyecto_id (apu_proyecto_rubro_id) = @p_apu_proyecto_id
		and apu_mano_obra_id in
		(select apu_mano_obra_id
	     from apu_proyecto_mano_obra
		 where apu_proyecto_id = @p_apu_proyecto_id
		 and apu_indice_id = @p_apu_indice_id )
	)

   -- se obtiene la sucursal del proyecto
   exec @v_int_sucursal_id = dbo._Apu_Proyecto_Int_Sucursal_Id @p_apu_proyecto_id
   
   -- Se obtiene el indice de mano de obra
   exec @v_ManoObra_Apu_Indice_Id = dbo._Apu_Parametros_ManoObra_Apu_Indice_Id @v_int_sucursal_id

   -- Se verifica si el indice que se recibio como parametro es el indice de
   -- mano de obra 
   if (@p_apu_indice_id = @v_ManoObra_Apu_Indice_Id)
   begin

      -- Se obtiene el indice del mecanico de mantenimiento
      exec @v_Equipo_Apu_Indice_id = dbo._Apu_Parametros_Equipo_Apu_Indice_Id @v_int_sucursal_id
       
      -- Se obtiene el costo del indice del mecanico de mantenimiento
      exec @v_costo_equipo = dbo._Apu_Proyecto_Equipo_Costo_Total_Indice @p_apu_proyecto_id, @v_Equipo_Apu_Indice_id
	  exec @v_costo_transporte = dbo._Apu_Proyecto_Transporte_Costo_Total_Indice @p_apu_proyecto_id, @v_equipo_apu_indice_id
	  exec @v_costo_material = dbo._Apu_Proyecto_Material_Costo_Total_Indice @p_apu_proyecto_id, @v_equipo_apu_indice_id
      set @v_total = dbo.__suma_dos_decimales_4 (@v_total, @v_costo_equipo, @v_costo_transporte, @v_costo_material)
   end

    RETURN  isnull(@v_total,0)
END


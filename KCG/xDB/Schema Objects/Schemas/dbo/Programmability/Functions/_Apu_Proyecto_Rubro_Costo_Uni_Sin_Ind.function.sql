

-- Costo unitario,	sin costos indirectos y sin costos otros
--La sumatoria se hace con cuatro decimales
CREATE FUNCTION [dbo].[_Apu_Proyecto_Rubro_Costo_Uni_Sin_Ind]
(
	@p_apu_proyecto_rubro_id varchar(17)
)
RETURNS numeric (17,4)
BEGIN
    
    declare 
       @v_equipo     numeric(17,4),
       @v_material   numeric(17,4),
       @v_transporte numeric(17,4),
       @v_mano_obra  numeric(17,4),
       @v_resultado  numeric(17,4),
	   @v_indirecto  numeric(17,4),
	   @v_apu_proyecto_id varchar(17),
       @v_porcentaje numeric(5,2)
    
   select @v_apu_proyecto_id = dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id(@p_apu_proyecto_rubro_id);       

    select @v_material   = 
		(select 
			isnull(sum (dbo._apu_proyecto_rubro_material_costo_diario_x_cantidad (id, @v_apu_proyecto_Id)),0)
		from  apu_proyecto_rubro_Material
		where apu_proyecto_rubro_id = @p_apu_proyecto_rubro_id)
  


    select @v_transporte = 
		(select 
			isnull(sum (dbo._apu_proyecto_rubro_material_transporte_costo_diario_x_cantidad(id, @v_Apu_Proyecto_Id)),0)
		from  apu_proyecto_rubro_Material 
		where apu_proyecto_rubro_id = @p_apu_proyecto_rubro_id)



    select @v_mano_obra  = 
		(select 
			isnull(sum (dbo._apu_proyecto_rubro_mano_obra_costo_x_rendimiento (id, @v_Apu_Proyecto_Id)),0)
		from  apu_proyecto_rubro_Mano_Obra
		where apu_proyecto_rubro_id = @p_apu_proyecto_rubro_id)


      
    select @v_equipo     = 
		(select 
			isnull(sum (dbo._apu_proyecto_rubro_equipo_costo_x_rendimiento (id,@v_Apu_Proyecto_Id)),0)
		from  apu_proyecto_rubro_Equipo 
		where apu_proyecto_rubro_id = @p_apu_proyecto_rubro_id)
      
    
    exec @v_resultado = dbo.__suma_cuatro_decimales_4 
                              @v_material,
                              @v_transporte,
                              @v_mano_obra,
                              @v_equipo 

    RETURN  isnull( @v_resultado,0)

END




















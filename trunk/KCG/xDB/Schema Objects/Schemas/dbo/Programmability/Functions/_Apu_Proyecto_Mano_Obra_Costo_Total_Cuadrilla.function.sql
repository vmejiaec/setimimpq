
CREATE FUNCTION [dbo].[_Apu_Proyecto_Mano_Obra_Costo_Total_Cuadrilla]
(
	@p_apu_proyecto_id varchar(17),
    @p_apu_mano_obra_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
            @v_total numeric(17,4),
            @v_int_sucursal_id varchar(17),
            @v_Equipo_apu_mano_obra_id varchar(17),
            @v_Equipo_Apu_Indice_id varchar(17),
            @v_costo_equipo numeric (17,4),
            @v_costo_transporte numeric (17,4),
            @v_costo_material numeric (17,4)

    set @v_total = 0

	select  @v_total = 
(         select
sum(total)
from
(
	select 
	  (select
		sum(
       dbo.__multiplicar_cuatro_decimales_2
	   (
		   dbo._apu_proyecto_rubro_mano_obra_costo_x_rendimiento (id,@p_apu_proyecto_id),
		   dbo._apu_proyecto_rubro_cantidad (apu_proyecto_rubro_id)
	   )
     )
	   from  apu_proyecto_rubro_mano_obra pr
	   where dbo._apu_proyecto_rubro_apu_proyecto_id (apu_proyecto_rubro_id) = @p_apu_proyecto_id
	   and apu_proyecto_mano_obra.apu_mano_obra_id =pr.Apu_mano_obra_id)total
	from apu_proyecto_mano_obra			 
	where  apu_proyecto_id = @p_apu_proyecto_id
	and apu_mano_obra_id = @p_apu_mano_obra_id
)total)

    set @v_total = isnull(@v_total,0)

    exec @v_int_sucursal_id = dbo._Apu_Proyecto_int_sucursal_id @p_apu_proyecto_id

    exec @v_equipo_Apu_Mano_Obra_Id = dbo._Apu_Parametros_Apu_Mano_Obra_Id @v_int_sucursal_id


	--@p_apu_mano_obra_id Es el parámetro que recibe la función
	--@v_equipo_Apu_Mano_Obra_Id Es el campo Apu_Parametrro.Apu_Mano_Obra_Id
    if (@v_equipo_Apu_Mano_Obra_Id = @p_apu_mano_obra_id)
     begin
        set @v_equipo_Apu_Indice_Id = isnull (dbo._Apu_Parametros_Equipo_Apu_Indice_Id( @v_int_sucursal_id),0)
        set @v_costo_equipo = isnull( dbo._Apu_Proyecto_Equipo_Costo_Total_Indice( @p_apu_proyecto_id, @v_equipo_apu_indice_id),0)
        set @v_costo_transporte = isnull(dbo._Apu_Proyecto_Transporte_Costo_Total_Indice (@p_apu_proyecto_id, @v_equipo_apu_indice_id),0)
		set @v_costo_material = isnull(dbo._Apu_Proyecto_Material_Costo_Total_Indice (@p_apu_proyecto_id, @v_equipo_apu_indice_id),0)
        set @v_total = dbo.__suma_cuatro_decimales_4(@v_total, @v_costo_equipo, @v_costo_transporte, @v_costo_material)
     
   end


    RETURN  isnull(@v_total,0)

END


















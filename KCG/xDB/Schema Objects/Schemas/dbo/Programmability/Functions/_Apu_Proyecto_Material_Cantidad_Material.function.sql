-- Esta funcion devuelve la sumatoria de la CANTIDAD de material 
-- utilziada en todo el proyecto.
create FUNCTION [dbo].[_Apu_Proyecto_Material_Cantidad_Material]
(
	@p_apu_proyecto_id varchar(17),
    @p_apu_material_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_cantidad numeric(17,4)

     select  @v_cantidad = 
             (select sum(cantidad)
              from  apu_proyecto_rubro_material
              where dbo._apu_proyecto_rubro_apu_proyecto_id (apu_proyecto_rubro_id) = @p_apu_proyecto_id
              and  apu_material_id = @p_apu_material_id)
      
    return  isnull(@v_cantidad,0)

END













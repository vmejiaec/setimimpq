-- Esta funcion devuelve la sumatoria de la CANTIDAD de mano de obra 
-- utilziada en todo el proyecto.
create FUNCTION [dbo].[_Apu_Proyecto_Mano_Obra_Cantidad_Mano_Obra]
(
	@p_apu_proyecto_id varchar(17),
    @p_apu_mano_obra_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_cantidad numeric(17,4)

     select  @v_cantidad = 
             (select sum(cantidad)
              from  apu_proyecto_rubro_mano_obra
              where dbo._apu_proyecto_rubro_apu_proyecto_id (apu_proyecto_rubro_id)
                    = @p_apu_proyecto_id
              and  apu_mano_obra_id = @p_apu_mano_obra_id)
      
    return  isnull(@v_cantidad,0)

END















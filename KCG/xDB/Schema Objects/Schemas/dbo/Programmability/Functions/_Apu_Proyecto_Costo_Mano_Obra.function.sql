

-- COSTO TOTAL DEL mano_obra DE UN PROYECTO
-- COSTO UNITARIO DE TODOS LOS mano_obraS DEL PROYECTO * CANTIDAD UTILIZADA EN TODOS LOS RUBROS
CREATE FUNCTION [dbo].[_Apu_Proyecto_Costo_Mano_Obra]
(
	@p_apu_proyecto_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_costo_total    numeric(17,4)

     select  @v_costo_total = 
             (  
                select sum(
					   dbo.__multiplicar_cuatro_decimales_2
					   (
						   dbo._apu_proyecto_rubro_mano_obra_costo_x_rendimiento (id,@p_apu_proyecto_id),
						   dbo._apu_proyecto_rubro_cantidad (apu_proyecto_rubro_id)
					   ))
				from apu_proyecto_rubro_mano_obra
				where dbo._apu_proyecto_rubro_apu_proyecto_id (apu_proyecto_rubro_id) = @p_apu_proyecto_id

             )

     return  isnull(@v_costo_total,0)



END


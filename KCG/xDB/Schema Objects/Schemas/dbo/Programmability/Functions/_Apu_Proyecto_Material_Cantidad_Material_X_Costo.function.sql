
-- Esta funcion devuelve el costo del material multiplicado
-- por la cantifaf utilizada en todo el proyecto
create FUNCTION [dbo].[_Apu_Proyecto_Material_Cantidad_Material_X_Costo]
(
	@p_apu_proyecto_id varchar(17),
    @p_apu_material_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
        @v_costo_total numeric (17,4)   


    set @v_costo_total =
     (select
         sum
         (
           dbo.__multiplicar_cuatro_decimales_2
	      (
		     dbo._Apu_Proyecto_Rubro_Material_Costo_Diario_x_Cantidad (id, @p_apu_proyecto_id),
		     dbo._apu_proyecto_rubro_cantidad (apu_proyecto_rubro_id)
	      )
         )
      from apu_proyecto_rubro_material
	  where dbo._apu_proyecto_rubro_apu_proyecto_id (apu_proyecto_rubro_id) = @p_apu_proyecto_id
	  and apu_material_id = @p_apu_material_id
		
     )     
     
     return  isnull(@v_costo_total,0)
END
















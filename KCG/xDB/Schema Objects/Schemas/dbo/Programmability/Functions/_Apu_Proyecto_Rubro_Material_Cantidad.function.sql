CREATE FUNCTION [dbo].[_Apu_Proyecto_Rubro_Material_Cantidad]
(
	@p_apu_proyecto_rubro_Material_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_cantidad numeric(17,4)
     
      select  @v_cantidad =
            (select cantidad
             from  apu_proyecto_rubro_Material
             where id = @p_apu_proyecto_rubro_Material_id)
      
    RETURN  @v_cantidad

END











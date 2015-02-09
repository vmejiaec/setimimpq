create FUNCTION [dbo].[_Apu_Rubro_Mano_Obra_Cantidad]
(
	@p_apu_rubro_mano_obra_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_cantidad numeric(17,4)
     
      select  @v_cantidad =
            (select cantidad
             from  apu_rubro_mano_obra
             where id = @p_apu_rubro_mano_obra_id)
      
    RETURN  @v_cantidad

END









create FUNCTION [dbo].[_Apu_Rubro_Mano_Obra_Costo_Hora]
(
	@p_apu_rubro_mano_obra_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_costo_total numeric(17,4)
     
      select  @v_costo_total = 
            (select dbo._apu_mano_obra_costo_hora (apu_mano_obra_id)
             from  apu_rubro_mano_obra
             where id = @p_apu_rubro_mano_obra_id)
      
    RETURN  isnull(@v_costo_total,0)

END










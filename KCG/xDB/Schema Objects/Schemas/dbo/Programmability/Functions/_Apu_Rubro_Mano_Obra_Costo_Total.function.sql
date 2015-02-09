create FUNCTION [dbo].[_Apu_Rubro_Mano_Obra_Costo_Total]
(
	@p_apu_rubro_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_costo_total numeric(17,4)
     
      select  @v_costo_total = 
            (select sum(dbo.__multiplicar_cuatro_decimales_2(
                   dbo._apu_mano_obra_costo_hora (apu_mano_obra_id),
                   cantidad))
             from  apu_rubro_mano_obra
             where apu_rubro_id = @p_apu_rubro_id)
      
    RETURN  isnull(@v_costo_total,0)

END







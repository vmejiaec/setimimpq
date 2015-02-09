CREATE FUNCTION [dbo].[_Apu_Oferta_Rubro_Mano_Obra_Costo]
(
	@p_apu_Oferta_rubro_Mano_Obra_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_costo numeric(17,4)
     
      select  @v_costo =
            (select costo
             from  apu_Oferta_rubro_Mano_Obra
             where id = @p_apu_Oferta_rubro_Mano_Obra_id)
      
    RETURN  isnull(@v_costo,0)

END













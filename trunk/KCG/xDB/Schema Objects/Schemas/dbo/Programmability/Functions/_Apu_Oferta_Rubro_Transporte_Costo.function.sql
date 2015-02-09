CREATE FUNCTION [dbo].[_Apu_Oferta_Rubro_Transporte_Costo]
(
	@p_Apu_Oferta_Rubro_Material_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_costo numeric(17,4)
     
      select  @v_costo =
            (select costo_transporte
             from  Apu_Oferta_Rubro_Material
             where Id = @p_apu_Oferta_rubro_Material_id)
      
    RETURN  isnull(@v_costo,0)

END














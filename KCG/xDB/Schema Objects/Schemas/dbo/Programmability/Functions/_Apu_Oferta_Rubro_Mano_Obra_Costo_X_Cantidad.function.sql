CREATE FUNCTION [dbo].[_Apu_Oferta_Rubro_Mano_Obra_Costo_X_Cantidad]
(
	@p_apu_Oferta_Rubro_Mano_Obra_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_costo numeric(17,4)

      select  @v_costo =
            (select 
	            dbo.__multiplicar_cuatro_decimales_2
                     ( costo,
                       dbo._apu_oferta_rubro_cantidad(apu_oferta_rubro_id)
                     )
             from  apu_Oferta_rubro_Mano_Obra
             where id = @p_apu_Oferta_rubro_Mano_Obra_id)
      
    return  isnull(@v_costo,0)

END














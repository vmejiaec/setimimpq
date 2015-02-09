create FUNCTION [dbo].[_Apu_Oferta_Rubro_Equipo_Costo_X_Cantidad]
(
	@p_apu_Oferta_Rubro_Equipo_id varchar(17)
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
             from  apu_Oferta_rubro_Equipo
             where id = @p_apu_Oferta_rubro_Equipo_id)
      
    return  isnull(@v_costo,0)

END















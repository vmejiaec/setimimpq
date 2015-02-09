	create FUNCTION [dbo].[_Apu_Oferta_Costo_Indice_Equipo]
(
	@p_apu_Oferta_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN

    declare 
      @v_int_sucursal_id varchar(17),
      @v_equipo_indice_id varchar(17),
      @v_costo numeric(17,4)
    
    exec @v_int_sucursal_id = dbo._Apu_Oferta_int_sucursal_id 
                              @p_apu_Oferta_id      

    exec @v_equipo_indice_id = dbo._apu_parametros_Equipo_Apu_Indice_Id 
                               @v_int_sucursal_id

    exec @v_costo = dbo._Apu_Oferta_Indice_Costo
                    @p_apu_Oferta_id, @v_equipo_indice_id
    
    return  isnull(@v_costo,0) 

END













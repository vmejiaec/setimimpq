
CREATE FUNCTION [dbo].[_Apu_Oferta_Costo_Transporte1]
(
	@p_Apu_Oferta_id varchar(17),
    @p_porcentaje numeric (5,2)
    
)
RETURNS numeric(17,4)
BEGIN
    
    declare 

      @v_costo numeric (17,4),
      @v_total numeric(17,4)

      
      exec @v_costo
           = dbo._Apu_Oferta_Costo_Transporte  @p_apu_Oferta_Id
         
      exec @v_total 
            = dbo.__porcentaje_cuatro_decimales @v_costo, @p_porcentaje
      
    return  isnull(@v_total,0)

END




















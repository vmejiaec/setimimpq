create FUNCTION [dbo].[__Porcentaje_Cuatro_Decimales]
(
   @p_valor numeric(17,4),
   @p_valor_porcentaje numeric(17,4)
)
RETURNS numeric(17,4)
BEGIN
    
    declare  @v_multiplicar numeric (17,4),
             @v_resultado numeric(17,4)

	exec  @v_multiplicar = dbo.__multiplicar_cuatro_decimales_2 @p_valor, @p_valor_porcentaje
    exec  @v_resultado  =  dbo.__division_cuatro_decimales  @v_multiplicar, 100 
            
    RETURN  @v_resultado

END












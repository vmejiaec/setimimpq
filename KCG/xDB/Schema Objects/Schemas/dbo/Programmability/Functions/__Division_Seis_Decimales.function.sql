create FUNCTION [dbo].[__Division_Seis_Decimales]
(
   @p_valor1 numeric(17,4),
   @p_valor2 numeric(17,4)
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_resultado numeric(17,4)

	select  @v_resultado = round (@p_valor1 / @p_valor2,6)

    RETURN  @v_resultado

END












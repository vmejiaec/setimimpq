create FUNCTION [dbo].[__Suma_Cuatro_Decimales_3]
(
   @p_valor1 numeric(17,4),
   @p_valor2 numeric(17,4),
   @p_valor3 numeric(17,4)
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_suma numeric(17,4)

	select  @v_suma = @p_valor1 + @p_valor2 + @p_valor3
            

    RETURN  @v_suma

END










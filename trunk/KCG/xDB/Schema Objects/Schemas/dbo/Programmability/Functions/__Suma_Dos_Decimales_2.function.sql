create FUNCTION [dbo].[__Suma_Dos_Decimales_2]
(
   @p_valor1 numeric(17,4),
   @p_valor2 numeric(17,4)
)
RETURNS numeric(17,2)
BEGIN
    
    declare @v_suma numeric(17,4)

	select  @v_suma = round(@p_valor1 + @p_valor2 ,2)
            
    RETURN  @v_suma

END













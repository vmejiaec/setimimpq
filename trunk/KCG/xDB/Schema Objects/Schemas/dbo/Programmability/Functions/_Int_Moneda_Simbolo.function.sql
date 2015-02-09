create FUNCTION [dbo].[_Int_Moneda_Simbolo]
(
	@p_int_moneda_id varchar(17)
)
RETURNS varchar(5)
BEGIN
    
    declare @v_simbolo varchar(5)

	select  @v_simbolo = 
            (select simbolo 
             from  int_moneda 
             where id = @p_int_moneda_id)

    RETURN  @v_simbolo

END













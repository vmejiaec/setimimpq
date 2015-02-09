create FUNCTION [dbo].[_Int_Moneda_Codigo]
(
	@p_int_moneda_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  int_moneda 
             where id = @p_int_moneda_id)

    RETURN  @v_codigo

END











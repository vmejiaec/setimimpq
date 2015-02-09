CREATE FUNCTION [dbo].[_Int_Sucursal_Int_Moneda_Id]
(
	@p_int_sucursal_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_int_moneda_id varchar(17)

	select  @v_int_moneda_id = 
            (select int_moneda_id 
             from  int_sucursal
             where id = @p_int_sucursal_id)

    RETURN  @v_int_moneda_id

END












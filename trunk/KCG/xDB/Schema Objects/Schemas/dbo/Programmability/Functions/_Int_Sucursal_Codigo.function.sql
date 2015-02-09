create FUNCTION [dbo].[_Int_Sucursal_Codigo]
(
	@p_int_sucursal_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  int_sucursal 
             where id = @p_int_sucursal_id)

    RETURN  @v_codigo

END











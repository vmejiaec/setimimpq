create FUNCTION [dbo].[_Int_Sucursal_Int_Empresa_Id]
(
	@p_int_sucursal_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_int_empresa_id varchar(17)

	select  @v_int_empresa_id = 
            (select int_empresa_id 
             from  int_sucursal 
             where id = @p_int_sucursal_id)

    RETURN  @v_int_empresa_id

END











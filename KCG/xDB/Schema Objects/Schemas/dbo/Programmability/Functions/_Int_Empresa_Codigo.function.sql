create FUNCTION [dbo].[_Int_Empresa_Codigo]
(
	@p_int_empresa_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  int_empresa 
             where id = @p_int_empresa_id)

    RETURN  @v_codigo

END











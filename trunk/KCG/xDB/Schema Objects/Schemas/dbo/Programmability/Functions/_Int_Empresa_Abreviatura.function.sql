create FUNCTION [dbo].[_Int_Empresa_Abreviatura]
(
	@p_int_empresa_id varchar(17)
)
RETURNS varchar(50)
BEGIN
    
    declare @v_abreviatura varchar(50)

	select  @v_abreviatura = 
            (select abreviatura 
             from  int_empresa 
             where id = @p_int_empresa_id)

    RETURN  @v_abreviatura

END













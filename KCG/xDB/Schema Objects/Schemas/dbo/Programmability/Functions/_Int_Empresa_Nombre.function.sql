create FUNCTION [dbo].[_Int_Empresa_Nombre]
(
	@p_int_empresa_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  int_empresa 
             where id = @p_int_empresa_id)

    RETURN  @v_nombre

END












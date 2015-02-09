CREATE FUNCTION [dbo].[_Int_Empresa_Imagen]
(
	@p_int_empresa_id varchar(17)
)
RETURNS varchar(2000)
BEGIN
    
    declare @v_imagen varchar(2000)

	select  @v_imagen = 
            (select imagen 
             from  int_empresa 
             where id = @p_int_empresa_id)

    RETURN  @v_imagen

END












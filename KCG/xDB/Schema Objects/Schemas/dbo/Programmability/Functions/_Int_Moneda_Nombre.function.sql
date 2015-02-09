create FUNCTION [dbo].[_Int_Moneda_Nombre]
(
	@p_int_moneda_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  int_moneda
             where id = @p_int_moneda_id)

    RETURN  @v_nombre

END











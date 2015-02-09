create FUNCTION [dbo].[_Int_Sucursal_Nombre]
(
	@p_int_sucursal_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  int_sucursal
             where id = @p_int_sucursal_id)

    RETURN  @v_nombre

END










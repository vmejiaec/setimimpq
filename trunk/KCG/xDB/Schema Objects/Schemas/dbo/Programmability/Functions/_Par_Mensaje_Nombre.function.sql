create FUNCTION [dbo].[_Par_Mensaje_Nombre]
(
	@p_par_mensaje_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  par_mensaje 
             where id = @p_par_mensaje_id)

    RETURN  @v_nombre

END













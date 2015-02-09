create FUNCTION [dbo].[_Par_Mensaje_Codigo_Mensaje]
(
	@p_par_mensaje_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo_mensaje varchar(200)

	select  @v_codigo_mensaje = 
            (select codigo_mensaje 
             from  par_mensaje 
             where id = @p_par_mensaje_id)

    RETURN  @v_codigo_mensaje

END













create FUNCTION [dbo].[_Par_Mensaje_Codigo]
(
	@p_par_mensaje_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  par_mensaje 
             where id = @p_par_mensaje_id)

    RETURN  @v_codigo

END












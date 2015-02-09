create FUNCTION [dbo].[_Par_Servidor_Codigo]
(
	@p_par_servidor_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  par_servidor
             where id = @p_par_servidor_id)

    RETURN  @v_codigo

END














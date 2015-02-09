create FUNCTION [dbo].[_Par_Servidor_Ruta]
(
	@p_par_servidor_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_ruta varchar(500)

	select  @v_ruta = 
            (select ruta
             from  par_servidor
             where id = @p_par_servidor_id)

    RETURN  @v_ruta

END















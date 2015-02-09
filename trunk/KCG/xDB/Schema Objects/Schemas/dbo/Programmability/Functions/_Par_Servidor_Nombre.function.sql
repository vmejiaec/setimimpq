create FUNCTION [dbo].[_Par_Servidor_Nombre]
(
	@p_par_servidor_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_nombre varchar(500)

	select  @v_nombre = 
            (select nombre 
             from  par_servidor 
             where id = @p_par_servidor_id)

    RETURN  @v_nombre

END













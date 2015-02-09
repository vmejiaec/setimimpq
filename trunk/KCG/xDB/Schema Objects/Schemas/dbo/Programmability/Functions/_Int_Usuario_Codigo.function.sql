create FUNCTION [dbo].[_Int_Usuario_Codigo]
(
	@p_int_usuario_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select codigo 
             from  int_usuario 
             where id = @p_int_usuario_id)

    RETURN  @v_codigo

END












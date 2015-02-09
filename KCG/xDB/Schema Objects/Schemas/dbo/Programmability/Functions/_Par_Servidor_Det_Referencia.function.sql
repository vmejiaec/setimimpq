create FUNCTION [dbo].[_Par_Servidor_Det_Referencia]
(
    @p_par_servidor_id varchar(17),
	@p_dic_contenedor_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_referencia varchar(500)

	select  @v_referencia = 
            (select referencia 
             from  par_servidor_det 
             where par_servidor_id = @p_par_servidor_id
 and dic_contenedor_id = @p_dic_contenedor_id)

    RETURN  @v_referencia

END













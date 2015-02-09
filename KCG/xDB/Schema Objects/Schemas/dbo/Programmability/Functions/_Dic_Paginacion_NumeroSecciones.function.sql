create FUNCTION [dbo].[_Dic_Paginacion_NumeroSecciones]
(
    @p_par_servidor_id varchar(17),
    @p_dic_objeto_id varchar(17)
)
RETURNS int
BEGIN
    
    declare @v_maxima int
                             
	select  @v_maxima = 
            (select max (secuencia)
             from  dic_paginacion 
             where par_servidor_id = @p_par_servidor_id
             and dic_objeto_id = @p_dic_objeto_id)

    RETURN  @v_maxima

END


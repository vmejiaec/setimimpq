create FUNCTION [dbo].[_Dic_Paginacion_Id1]
(
    @p_par_servidor_id varchar(17),
    @p_dic_objeto_id varchar(17),
	@p_secuencia int
)
RETURNS varchar (17)
BEGIN
    
    declare @v_dic_paginacion_id varchar(17)

	select  @v_dic_paginacion_id = 
            (select id 
             from  dic_paginacion 
             where dic_objeto_id = @p_dic_objeto_id
             and par_servidor_id = @p_par_servidor_id
             and secuencia = @p_secuencia)

    RETURN  @v_dic_paginacion_id

END










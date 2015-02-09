create FUNCTION [dbo].[_Dic_Paginacion_Id_Inicial]
(
    @p_dic_paginacion_id varchar(17)
)
RETURNS varchar (17)
BEGIN
    
    declare @v_Id_Inicial varchar(17)
                             
	select  @v_Id_Inicial = 
            (select id_inicial 
             from  dic_paginacion 
             where id = @p_dic_paginacion_id)

    RETURN  @v_Id_Inicial

END


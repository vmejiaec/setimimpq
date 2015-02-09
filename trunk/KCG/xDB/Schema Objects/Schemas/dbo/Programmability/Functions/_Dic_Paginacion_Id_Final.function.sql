create FUNCTION [dbo].[_Dic_Paginacion_Id_Final]
(
    @p_dic_paginacion_id varchar(17)
)
RETURNS varchar (17)
BEGIN
    
    declare @v_Id_Final varchar(17)
                             
	select  @v_Id_Final = 
            (select id_final 
             from  dic_paginacion 
             where id = @p_dic_paginacion_id)

    RETURN  @v_Id_Final

END

create FUNCTION [dbo].[_Dic_Campo_Id]
(
	@p_dic_objeto_id varchar(17),
    @p_nombre varchar(500)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_id varchar(17)

	select  @v_id = 
            (select id 
             from  dic_campo
             where dic_objeto_id = @p_dic_objeto_id
             and   nombre = @p_nombre)

    RETURN  @v_id

END






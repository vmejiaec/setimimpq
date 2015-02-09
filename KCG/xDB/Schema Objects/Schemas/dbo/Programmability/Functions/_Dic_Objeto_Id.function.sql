create FUNCTION [dbo].[_Dic_Objeto_Id]
(
	@p_nombre varchar(500)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_dic_objeto_id varchar(17)

	select  @v_dic_objeto_id = 
            (select id 
             from  dic_objeto 
             where UPPER(nombre) = UPPER(@p_nombre))

    RETURN  @v_dic_objeto_id

END







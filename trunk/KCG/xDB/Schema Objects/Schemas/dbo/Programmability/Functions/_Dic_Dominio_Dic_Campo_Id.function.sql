create FUNCTION [dbo].[_Dic_Dominio_Dic_Campo_Id]
(
	@p_dic_dominio_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_dic_campo_id varchar(17)

	select  @v_dic_campo_id = 
            (select dic_campo_id 
             from  dic_dominio 
             where id = @p_dic_dominio_id)

    RETURN  @v_dic_campo_id

END












